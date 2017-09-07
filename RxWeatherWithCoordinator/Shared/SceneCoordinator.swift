//
// Created by Douglas Barreto on 06/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum SceneCoordinatorError: Error {
    case currentViewControllerNotHasNavigation
}

final class SceneCoordinator: SceneCoordinatorType {
    
    private let window: UIWindow
    
    var currentViewController: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController!
    }
    
    func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void> {
        switch type {
        case .push(let animated):
            return push(to: scene.viewController(), animated: animated)
        }
    }
    
    func pop(animated: Bool) -> Observable<Void> {
        let subject = PublishSubject<Void>()
        return subject
    }
    
    private func push(to viewController: UIViewController, animated: Bool) -> Observable<Void> {
        let subject = PublishSubject<Void>()
        
        guard let navigationController = currentViewController.navigationController else {
            subject.onError(SceneCoordinatorError.currentViewControllerNotHasNavigation)
            return subject
        }
        
        _ = navigationController.rx
                            .delegate
                            .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
                            .map{ _ in }
                            .bind(to: subject)
        
        navigationController.pushViewController(viewController, animated: animated)
        
        return subject
    }
}

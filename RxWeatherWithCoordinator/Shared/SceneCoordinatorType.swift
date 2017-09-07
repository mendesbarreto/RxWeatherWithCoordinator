//
// Created by Douglas Barreto on 06/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit
import RxSwift

protocol SceneCoordinatorType {
    var currentViewController: UIViewController { get }
    
    init(window: UIWindow)

    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void>
    
    @discardableResult
    func pop(animated: Bool) -> Observable<Void>
}

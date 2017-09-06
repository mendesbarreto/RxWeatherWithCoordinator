//
//  Scene.swift
//  RxWeatherWithCoordinator
//
//  Created by Douglas Barreto on 06/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import UIKit

enum Scene {
    case cities(CitiesViewModel)
    case cityDetail(CityDetailViewModel)
}

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .cities(let viewModel):
            var vc = CitiesViewController()
            let nc = UINavigationController(rootViewController: vc)
            vc.bindViewModel(to: viewModel)
            return nc
            
        case .cityDetail(let viewModel):
            var vc = CityDetailViewController()
            vc.bindViewModel(to: viewModel)
            return vc
        }
    }
}

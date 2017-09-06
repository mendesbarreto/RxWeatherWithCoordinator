//
//  BindableType.swift
//  RxWeatherWithCoordinator
//
//  Created by Douglas Barreto on 06/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import UIKit

protocol BindableType {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    mutating func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

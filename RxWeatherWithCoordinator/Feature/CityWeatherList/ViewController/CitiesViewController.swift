//
//  CitiesViewController.swift
//  RxWeatherWithCoordinator
//
//  Created by Douglas Barreto on 06/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import UIKit

final class CitiesViewController: UIViewController, BindableType {
    typealias ViewModelType = CitiesViewModel
    
    var viewModel: ViewModelType! = CitiesViewModel()

    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


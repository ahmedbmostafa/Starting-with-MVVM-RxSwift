//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by ahmed mostafa on 12/13/20.
//  Copyright © 2020 ahmed mostafa. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    
    func start() {
        
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel(restaurantService: RestaurantService()))
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
}

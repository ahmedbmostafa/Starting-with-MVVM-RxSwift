//
//  RestaurantListViewModel.swift
//  MVVMRxSwift
//
//  Created by ahmed mostafa on 12/13/20.
//  Copyright © 2020 ahmed mostafa. All rights reserved.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    
    let title = "Restaurants"
    private let restaurantService: RestaurantService
    
    
 //   private let restaurantService: RestaurantServiceProtocol
    
//    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
//        self.restaurantService = restaurantService
//    }
    
    
    init(restaurantService: RestaurantService){
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantsViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0) } }
        
    }
    
}

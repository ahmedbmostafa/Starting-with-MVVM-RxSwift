//
//  RestaurantViewModel.swift
//  MVVMRxSwift
//
//  Created by ahmed mostafa on 12/13/20.
//  Copyright © 2020 ahmed mostafa. All rights reserved.
//

import Foundation



struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name.capitalized + " _ " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    
}

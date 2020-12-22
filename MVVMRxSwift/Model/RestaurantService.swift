//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by ahmed mostafa on 12/13/20.
//  Copyright © 2020 ahmed mostafa. All rights reserved.
//

import Foundation
import RxSwift


//protocol RestaurantServiceProtocol {
//
//    func fetchRestaurants() -> Observable<[Restaurant]>
//}

//class RestaurantService: RestaurantServiceProtocol {

    class RestaurantService {

    func fetchRestaurants() -> Observable<[Restaurant]> {
        
        return Observable.create { (observer) -> Disposable in
            
//            let task = URLSession.shared.dataTask(with: URL(string: "your_url")!) { (data, resp, err) in
//
//            } .resume
            
            guard let path = Bundle.main.path(forResource: "resturante", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
                
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
        
    }
    
}

//
//  MealsData.swift
//  McDonalds
//
//  Created by Dulin Gleb on 23.9.23..
//

import UIKit

class MealsData {
    static let shared = MealsData()
    
    var meals: [Meal]
    
    private init() {
        meals = [
            Meal(name: "Burger", price: 10, image: #imageLiteral(resourceName: "burger")),
            Meal(name: "French Frice", price: 8, image: #imageLiteral(resourceName: "frenchFrice")),
            Meal(name: "Coca-cola", price: 4, image: #imageLiteral(resourceName: "cola"))
        ]
    }
}

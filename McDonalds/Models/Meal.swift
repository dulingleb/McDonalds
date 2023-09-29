//
//  Meal.swift
//  McDonalds
//
//  Created by Dulin Gleb on 21.9.23..
//

import UIKit

struct Meal {
    let name: String
    let price: Double
    let image: UIImage?
    
    var overviews: [Feedback] = []
    
    var evarageMark: Double {
        overviews.count == 0 ? 0 : Double(overviews.map { $0.mark }.reduce(0, +)) / Double(overviews.count)
    }
}

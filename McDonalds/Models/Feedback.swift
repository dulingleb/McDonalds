//
//  Overview.swift
//  McDonalds
//
//  Created by Dulin Gleb on 21.9.23..
//

import UIKit

struct Feedback {
    private var date = Date()
    
    let text: String
    let mark: Int
    
    init(text: String, mark: Int) {
        self.text = text
        self.mark = mark
    }
}

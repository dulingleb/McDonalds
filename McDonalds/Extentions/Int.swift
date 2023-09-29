//
//  Int.swift
//  McDonalds
//
//  Created by Dulin Gleb on 25.9.23..
//

import Foundation

extension Int {
    static func parse(from string: String) -> Int? {
        Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}

//
//  City.swift
//  MyFirst
//
//  Created by Derrick on 04/04/23.
//

import Foundation

struct City: Codable, Identifiable {
    var id: Int
    var name: String
    var code: Int
    var district: String
    var population: Int
}

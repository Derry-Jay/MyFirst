//
//  Item.swift
//  MyFirst
//
//  Created by Derrick on 23/04/23.
//

import Foundation

// MARK: - Welcome10
struct Item: Codable, Identifiable {
    let id, title: String
    let price: Int
    let category: ItemCategory
    let description: String
    let createdBy: CreatedBy
    let createdAt, updatedAt, slug, image: String
}

// MARK: - Category
struct ItemCategory: Codable, Identifiable {
    let id, name, slug: String
}

// MARK: - CreatedBy
struct CreatedBy: Codable, Identifiable {
    let role, id, name: String
}

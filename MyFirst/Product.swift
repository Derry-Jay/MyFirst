//
//  Product.swift
//  MyFirst
//
//  Created by Derrick on 23/04/23.
//

import Foundation

// MARK: - Welcome5
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let images: [String]
    let creationAt, updatedAt: String
    let category: ProductCategory
    static var emptyProduct: Product = Product(id: -1, title: "", price: 0, description: "", images: [], creationAt: "", updatedAt: "", category: ProductCategory.emptyProductCategory)
}

// MARK: - Category
struct ProductCategory: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let creationAt, updatedAt: String
    static var emptyProductCategory: ProductCategory = ProductCategory(id: -1, name: "", image: "", creationAt: "", updatedAt: "")
}

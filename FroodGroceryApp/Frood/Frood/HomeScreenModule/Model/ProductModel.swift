//
//  ProductModel.swift
//  Frood
//
//  Created by Mohammad Shariq on 11/05/25.
//

import Foundation

struct ProductModel: Identifiable {
    let id = UUID()
    let productImage: String
    let productName: String
    let productPrice: Double
}

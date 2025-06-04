//
//  ProductViewModel.swift
//  Frood
//
//  Created by Mohammad Shariq on 11/05/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [ProductModel] = [
        
        ProductModel(productImage: "apple", productName: "Apple", productPrice: 100.0),
        ProductModel(productImage: "avacado", productName: "Avocado", productPrice: 200.0),
        ProductModel(productImage: "banana", productName: "Banana", productPrice: 50.0),
        ProductModel(productImage: "blackbarry", productName: "Blackbarry", productPrice: 210.0),
        ProductModel(productImage: "fig", productName: "Fig", productPrice: 30.0),
        ProductModel(productImage: "graps", productName: "Black Graps", productPrice: 60.0),
        ProductModel(productImage: "orange", productName: "Oranges", productPrice: 80.0),
        ProductModel(productImage: "pineapple", productName: "PineApple", productPrice: 100.0),
        ProductModel(productImage: "pomegranate", productName: "Pomegranate", productPrice: 500.0),
        ProductModel(productImage: "strobarry", productName: "Strawberry", productPrice: 300.0)
    ]
}

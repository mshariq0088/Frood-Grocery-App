//
//  HomeScreenView.swift
//  Frood
//
//  Created by Mohammad Shariq on 10/05/25.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                HStack(spacing: 16) {
                    Image(product.productImage)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(product.productName)
                            .font(.headline)
                        Text(String(format: "$%.2f", product.productPrice))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Button("Add") {
                        print("Add \(product.productName) to cart")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Fruits List")
        }
    }
}


#Preview {
    HomeScreenView()
}

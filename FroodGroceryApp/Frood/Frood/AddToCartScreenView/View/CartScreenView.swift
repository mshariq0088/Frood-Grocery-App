//
//  CartScreenView.swift
//  Frood
//
//  Created by Mohammad Shariq on 10/05/25.
//

import SwiftUI

struct CartScreenView: View {
    var body: some View {
        Color.pink.ignoresSafeArea().overlay(Text("Cart").font(.largeTitle))
    }
}

#Preview {
    CartScreenView()
}

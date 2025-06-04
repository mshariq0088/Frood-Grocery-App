//
//  CustomTabBarView.swift
//  Frood
//
//  Created by Mohammad Shariq on 10/05/25.
//

import SwiftUI

enum Tab {
    case home
    case order
    case search
    case cart
    case profile
}

struct CustomTabBarView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .home:
                        HomeScreenView()
                    case .order:
                        OrderScreenView()
                    case .search:
                        SearchScreenView()
                    case .cart:
                        CartScreenView()
                    case .profile:
                        ProfileScreenView()
                }
            }
            
            .ignoresSafeArea(.all, edges: .top)
            
            HStack {
                TabBarButtonView(icon: "house.fill", title: "Home", tab: .home, selectedTab: $selectedTab)
                TabBarButtonView(icon: "basket.fill", title: "Order", tab: .order, selectedTab: $selectedTab)
                TabBarButtonView(icon: "magnifyingglass", title: "Search", tab: .search, selectedTab: $selectedTab)
                TabBarButtonView(icon: "cart.fill", title: "Cart", tab: .cart, selectedTab: $selectedTab)
                TabBarButtonView(icon: "person.fill", title: "Profile", tab: .profile, selectedTab: $selectedTab)
            }
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .padding(.bottom, 30)
            .shadow(radius: 5)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CustomTabBarView()
}

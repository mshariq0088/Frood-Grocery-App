//
//  TabBarButtonView.swift
//  Frood
//
//  Created by Mohammad Shariq on 10/05/25.
//

import SwiftUI

struct TabBarButtonView: View {
    var icon: String
    var title: String
    var tab: Tab
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.caption)
            }
            .foregroundStyle(selectedTab == tab ? Color.black : Color.gray)
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    TabBarButtonView()
//}

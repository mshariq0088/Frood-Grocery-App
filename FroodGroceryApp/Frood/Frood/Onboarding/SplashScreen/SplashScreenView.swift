//
//  SplashScreenView.swift
//  FroodGroceryApp
//
//  Created by Mohammad Shariq on 07/05/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var animate = false
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                //Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 76/255, green: 0/255, blue: 38/255),
                        Color(red: 130/255, green: 33/255, blue: 212/255)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 5) {
                    Image("splash_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(10)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : 20)
                        .animation(.easeOut(duration: 1), value: animate)
                    
                    
                    Text("frood")
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : 20)
                        .animation(.easeOut(duration: 1).delay(0.2), value: animate)
                    
                    Text("Fresh groceries at your door step in minutes")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                        .padding(2)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : 20)
                        .animation(.easeOut(duration: 1).delay(0.4), value: animate)
                }
            }
            .onAppear() {
                animate = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}


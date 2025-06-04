//
//  OTPBoxView.swift
//  Frood
//
//  Created by Mohammad Shariq on 09/05/25.
//

import SwiftUI

struct OTPBoxView: View {
    @Binding var text: String
    var isFocused: Bool
    var isCorrect: Bool = false
    var onBackSpace: (() -> Void)? = nil
    
    var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .multilineTextAlignment(.center)
            .frame(width: 45, height: 55)
            .background(isCorrect ? Color.green : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? Color.green : Color.clear, lineWidth: 2)
            )
            .onChange(of: text) { newValue in
                if newValue.count > 1 {
                    text = String(newValue.prefix(1))
                } else if newValue.isEmpty {
                    onBackSpace?() 
                }
            }
        
            
    }
}

//#Preview {
//    OTPBoxView(text: <#Binding<String>#>, isFocused: <#Bool#>)
//}

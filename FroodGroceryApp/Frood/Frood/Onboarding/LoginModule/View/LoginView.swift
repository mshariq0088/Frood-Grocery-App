//
//  LoginView.swift
//  Frood
//
//  Created by Mohammad Shariq on 08/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage = ""
    @State private var navigateOTP = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 61/255, green: 5/255, blue: 97/255),
                        Color(red: 122/255, green: 20/255, blue: 130/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("frood")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(
                            colors: [Color(red: 239/255, green: 83/255, blue: 80/255),Color(red: 255/255, green: 112/255, blue: 67/255)],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                    Text("Groceries delivered in\n10 minutes")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    //Mobile Number Text Field
                    HStack {
                        Text("+91")
                            .foregroundColor(.black.opacity(0.6))
                        TextField("Enter Your Mobile Number", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    
                    //Continue Button
                    Button(action: {
                        if isValidPhoneNumber(phoneNumber) {
//                            errorMessage = ""
//                            showError = false
                            navigateOTP = true
                        } else {
                            errorMessage = "Please enter a valid 10-digit mobile number."
                            withAnimation {
                                showError = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showError = false
                                }
                            }
                        }
                    }) {
                        
                            Text("Continue")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        colors: [Color(red: 139/255, green: 83/255, blue: 80/255),
                                                 Color(red: 255/255, green: 122/255, blue: 57/255)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            .cornerRadius(25)
                            .padding(.horizontal)
                    }
                    NavigationLink(destination: OTPScreenView(), isActive: $navigateOTP) {
                    }
                    Spacer()
                
                    
                    //Text
                    VStack(spacing:4) {
                        Text("By continuing, you agree to our")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.footnote)
                        
                        //Privacy And Policy Button
                        Button(action: {
                            print("Privacy And Polic")
                        }) {
                            NavigationLink(destination: TermsAndConditions()) {
                                Text("Terms and Conditions")
                                    .foregroundColor(Color(red: 255/255, green: 112/255, blue: 67/255))
                                    .font(.footnote.bold())
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                   
                }
                
                // Snackbar Alert
                if showError {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                            .padding(.bottom, 30)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                            .animation(.easeInOut, value: showError)
                    }
                }
            }
        }
    }
    
    private func isValidPhoneNumber(_ number: String) -> Bool {
        let trimmed = number.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard trimmed.count == 10 else {
            if trimmed.count == 9 {
                errorMessage = "Mobile number must be 10 digits."
            } else {
                errorMessage = "Please enter a valid 10-digit mobile number."
            }
            showSnackbar()
            return false
        }
        
        let regex = "^[6-9][0-9]{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if !predicate.evaluate(with: trimmed) {
            errorMessage = "Enter a valid Indian mobile number starting with 6-9."
            showSnackbar()
            return false
        }
        
        return true
    }

    private func showSnackbar() {
        withAnimation {
            showError = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showError = false
            }
        }
    }


}

#Preview {
    LoginView()
}

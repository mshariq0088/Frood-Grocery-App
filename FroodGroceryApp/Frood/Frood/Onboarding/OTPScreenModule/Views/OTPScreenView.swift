//
//  OTPScrrenView.swift
//  Frood
//
//  Created by Mohammad Shariq on 09/05/25.
//

import SwiftUI

struct OTPScreenView: View {
    @State private var otpField = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    @State private var timerCount = 30
    @State private var canResend = false
    @State private var isOTPValid = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isOTPCorrect = false
    
    
    let phoneNumber = "+91 9032910340"
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 76/255, green: 0/255, blue: 38/255),
                        Color(red: 130/255, green: 33/255, blue: 212/255)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    Spacer().frame(height: 60)
                    Text("OTP \nVerification")
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("OTP has been send to \(phoneNumber)")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    
                    
                    HStack(spacing: 12) {
                        ForEach(0..<6, id: \.self) { index in
                            otpTextField(at: index)
                        }
                    }
                    // Countdown Timer
                    Text(String(format: "00 : %02d", timerCount))
                        .foregroundColor(.white)
                        .font(.title2)
                        .onAppear(perform: startTimer)
                    
                    // Resend option
                    VStack(spacing: 6) {
                        Text("Didn't get it?")
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button(action: {
                            if canResend {
                                resendOtp()
                            }
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Send OTP (SMS)")
                                    .underline()
                            }
                            .foregroundColor(canResend ? Color.orange : Color.gray)
                            .font(.footnote.bold())
                        }
                        .disabled(!canResend)
                    }
                    
//                     Hidden NavigationLink to trigger screen change
                    NavigationLink(destination: CustomTabBarView(), isActive: $isOTPValid) {
                        
                    }
                    Spacer()
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                        }
                    }
                }
                
                if showError {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red.opacity(0.9))
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .animation(.easeInOut, value: showError)
                }
            }
        }
    }

        func startTimer() {
            canResend = false
            timerCount = 30
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if timerCount > 0 {
                    timerCount -= 1
                } else {
                    canResend = true
                    timer.invalidate()
                }
            }
        }

        func resendOtp() {
            otpField = Array(repeating: "", count: 6)
            focusedIndex = 0
            startTimer()
            print("OTP resent")
        }
    
    @ViewBuilder
    private func otpTextField(at index: Int) -> some View {
        let binding = Binding<String>(
            get: { self.otpField[index] },
            set: { self.otpField[index] = $0 }
        )

        return OTPBoxView(
            text: binding,
            isFocused: focusedIndex == index,
            isCorrect: isOTPCorrect,
            onBackSpace: {
                if otpField[index].isEmpty && index > 0 {
                    focusedIndex = index - 1
                }
            }
        )
        .focused($focusedIndex, equals: index)
        .onChange(of: otpField[index]) { newValue in
            if newValue.count > 1 {
                otpField[index] = String(newValue.prefix(1))
            }

            if !newValue.isEmpty {
                if index < 5 {
                    focusedIndex = index + 1
                } else {
                    focusedIndex = nil
                    validateOTP()
                }
            }
        }
    }
    
    private func validateOTP() {
        let otp = otpField.joined()
        if otp.count == 6 {
            print("Entered OTP: \(otp)")
            if otp == "123456" {
                isOTPCorrect = true
                DispatchQueue.main.async {
                    isOTPValid = true
                }
            } else {
                isOTPCorrect = false
                errorMessage = "Invalid OTP. Please try again."
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
        
    }

}

#Preview {
    OTPScreenView()
}

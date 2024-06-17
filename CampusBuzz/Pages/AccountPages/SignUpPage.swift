//
//  SignUpPage.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/5/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct SignUpPage: View {
    
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    @State private var input1: String = ""
    @State private var input2: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundMain")
                
                VStack {
                    
                    GroupBox(label: Text("Sign Up"), content: {
                        //Email field
                        TextField(text: $input1, label: {
                            Text("Email")
                        })
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 10)
                        
                        //Password Field
                        SecureField(text: $input2, label: {
                            Text("Password")
                        })
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 10)
                        
                        //Sign up button
                        Button(action: {
                            //Google automatically verifies input fields and produces an error message
                            authVM.registerUser(email: input1, pass: input2)
                            input1 = ""
                            input2 = ""
                        }, label: {
                            Text("Sign Up")
                        })
                        .frame(width: 100, height: 40)
                        .background(Color("BackgroundMain"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                        
                        //Login Link
                        NavigationLink(destination: {
                            LoginPage()
                        }, label: {
                            Text("Already have an account? **Login**")
                        })
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .padding(.top, 10)
                    })
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                           .fill(Color.white)
                           .shadow(radius: 4)
                    )
                    .padding()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SignUpPage()
}

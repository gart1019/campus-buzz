//
//  LoginPage.swift
//  TicketFinderMock2
//
//

import SwiftUI
import Firebase

struct LoginPage: View {
    
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    @State var input1: String = ""
    @State var input2: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundSecondary")
                
                GroupBox(label: Text("Login"), content: {
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
                    
                    //Login button
                    Button(action: {
                        authVM.logInUser(email: input1, pass: input2)
                    }, label: {
                        Text("Login")
                    })
                    .frame(width: 100, height: 40)
                    .background(Color("BackgroundMain"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
                    
                    //Forgor password Link
                    Button(action: {
                        
                    }, label: {
                        Text("Forgot Password?")
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
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginPage()
}

//
//  AuthenticationViewModel.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/29/24.
//

import Foundation
import FirebaseCore
import Firebase
import FirebaseAuth

///ViewModel to handle application authentication
class AuthenticationViewModel: ObservableObject {
    
    @Published var displayName: String? = ""
    
    @Published var showAlert: Bool = false
    @Published var alertMsg: String = ""
    @Published var authState = UserDefaults.standard.bool(forKey: "AuthState")
    
    //MARK: Registration
    
    ///Register a new user with an email & password
    func registerUser(email: String, pass: String) {
        Auth.auth().createUser(withEmail: email, password: pass) { [self] result, error in
            if let error = error {
                print(error.localizedDescription)
                print(authState)
                alertMsg = error.localizedDescription
                showAlert = true
            } else if result != nil {
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "AuthState")
                    self.authState = true
                }
            }
        }
    }
    
    
    
    //MARK: Logging In
    
    ///Sign in a user with saved credentials using an email & password
    func logInUser(email: String, pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass) { [self] result, error in
            if let error = error {
                print(error.localizedDescription)
                print(authState)
                alertMsg = error.localizedDescription
                showAlert = true
            } else if result != nil {
                print(result ?? "Signed in")
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "AuthState")
                    self.authState = true
                }
            }
        }
    }
}

enum AuthState {
    ///When the user is signed out of the application
    case signedOut
    ///When the user is signed into the application
    case signedIn
}

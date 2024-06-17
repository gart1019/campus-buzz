//
//  ContentView.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 4/30/24.
//

import SwiftUI

//App entry point
struct ContentView: View {
    
    @StateObject var authVM = AuthenticationViewModel()
    
    var body: some View {
        return Group {
            ZStack {
                if authVM.authState {
                    ClubListing(authVM: authVM)
                } else {
                    SignUpPage()
                }
            }
            .alert(isPresented: $authVM.showAlert) {
                Alert(title: Text("Error"), message: Text(authVM.alertMsg), dismissButton: Alert.Button.default(Text("Dismiss")))
            }
        }
        .environmentObject(authVM)
        .onAppear(perform: {
            authVM.authState = UserDefaults.standard.bool(forKey: "AuthState")
        })
    }
}

#Preview {
    ContentView()
}




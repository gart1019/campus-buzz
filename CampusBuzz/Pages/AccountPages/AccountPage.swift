//
//  AccountPage.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/1/24.
//

import SwiftUI

struct AccountPage: View {
    
    @State private var appTheme: Color = Color.white
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
                    .padding(40)
                
                
                
                Button(action: {
                    
                }, label: {
                    Text("Logout")
                })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Account Settings")
        }
    }
}

#Preview {
    AccountPage()
}

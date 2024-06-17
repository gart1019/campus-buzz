//
//  ClubListing.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/24/24.
//

import SwiftUI

struct ClubListing: View {
    
    @ObservedObject var authVM: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    NavigationLink(destination: {
                        ClubPage(authVM: authVM)
                    }, label: { GroupedView(title: "Leander High School", rank: "Member") })
                    .buttonStyle(PlainButtonStyle())
                    
                    //MARK: Check Auth State
                    Button(action: {
                        print(authVM.authState)
                    }, label: {
                        Text("Test Auth State")
                            .foregroundStyle(.white)
                    })
                }
            }
            .scrollIndicators(.never)
            .safeAreaPadding()
            .navigationTitle("Your Clubs")
            .navigationBarBackButtonHidden()
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: "AuthState")
                        authVM.authState = false
                    }, label: {
                        Image("Logout")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    })
                })
            }
        }
    }
}

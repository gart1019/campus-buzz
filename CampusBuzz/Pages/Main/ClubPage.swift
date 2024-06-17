//
//  ClubPage.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/24/24.
//

import SwiftUI

struct ClubPage: View {
    
    @StateObject var viewModel = ClubViewModel()
    @ObservedObject var authVM: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                HStack {
                    Image(systemName: "person.3.fill")
                    Text("^[\(viewModel.groupMembers) Member](inflect: true)")
                }
                .foregroundStyle(.secondary)
                .padding(.bottom, 4)
                
                AnnouncementSection(cardTitle: viewModel.phrase)
                
                //This displays horizontal groups
                VStack {
                    ForEach(createSections(organizedEvents: createDateList(eventList: eventList), viewModel: viewModel)) { group in
                        group
                    }
                }
            }
//            .safeAreaPadding()
            .navigationTitle("Home")
            .navigationBarBackButtonHidden()
            .sheet(isPresented: $viewModel.showingSheet, content: {
                PurchaseDetail(viewModel: viewModel)
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            })
            
            //TOOLBAR
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(destination: {
                        ClubListing(authVM: authVM)
                    }, label: {
                        Image(systemName: "arrow.left")
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: {
                        AccountPage()
                    }, label: {
                        Image(systemName: "person.crop.circle")
                    })
                })
            })
        }
    }
}

//#Preview {
//    ClubPage()
//}

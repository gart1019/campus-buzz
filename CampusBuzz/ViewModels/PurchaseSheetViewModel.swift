//
//  PurchaseSheetViewModel.swift
//  Campus Buzz
//
//  Created by Garrett Norman on 6/6/24.
//

import Foundation

final class ClubViewModel: ObservableObject {
    //MARK: Club Information
    var clubId: String? //Firestore ref ID
    var groupMembers: Int = 24 //Network call to get the total members within a club
    @Published var phrase: String = "Go Lions!"
    
    @Published var sheetContent: Event?
    @Published var showingSheet = false
    
    func showDetailSheet(eventDetails: Event) {
        sheetContent = eventDetails
        showingSheet = true
    }
    
}

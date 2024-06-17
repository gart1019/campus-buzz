//
//  TicketFinderMock2App.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 4/30/24.
//

import SwiftUI
import Firebase

@main
struct CampusBuzzApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

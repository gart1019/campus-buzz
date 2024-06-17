//
//  SportTypes.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/1/24.
//

import Foundation

enum Sport: CaseIterable {
    case xc
    case track
    case swim
    case football
    case basketball
    case soccer
    case baseball
    case tennis
    case softball
}

enum Highlights: CaseIterable {
    case large
    case medium
    case small
    
    case concessions
    case noConcessions
    
    case seating
    case noSeating
}

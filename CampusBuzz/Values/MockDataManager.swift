//
//  MockData.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/3/24.
//

import Foundation
import SwiftUI

struct Event: Hashable, Identifiable {
    
    var title: String {
        switch sport {
        case .xc:
            return "Cross Country"
        case .baseball:
            return "Baseball"
        case .basketball:
            return "Basketball"
        case .football:
            return "Football"
        case .soccer:
            return "Soccer"
        case .softball:
            return "Softball"
        case .swim:
            return "Swim"
        case .tennis:
            return "Tennis"
        case .track:
            return "Track & Field"
        }
    }
    
    
    //TODO: Change date values from integers to Date() for Firestore
    var sport: Sport
    var date: [Int]  //Change to Date()
    var time: String //Remove
    var host: Campus
    var price: Int
    let id: UUID = UUID()
    
}

struct Campus: Identifiable, Hashable {
    var name: String
    var address: String
    var sports: [Sport]
    let highlights: [String:String]
    let id: UUID = UUID()
    var abbreviatedName: String {
        let words = name.split(separator: " ")
        let abbreviation = words.map { $0.prefix(0) }.joined()
        return abbreviation
    }
}

var lhs: Campus = Campus(
    name: "Leander High School",
    address: "3301 S Bagdad Rd",
    sports: [.baseball, .basketball],
    highlights: [
        "Large Campus":"building.2.fill",
        "Concessions":"fork.knife"])

var eventList: [Event] = [
    Event(sport: .softball, date: [1,1], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .xc, date: [1,1], time: "3:45 pm", host: lhs, price: 4),
    Event(sport: .swim, date: [1,2], time: "5:00 pm", host: lhs, price: 3),
    Event(sport: .softball, date: [1,2], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .football, date: [1,2], time: "4:00 pm", host: lhs, price: 3),
    Event(sport: .softball, date: [3,3], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .tennis, date: [3,3], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .soccer, date: [3,3], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .softball, date: [3,4], time: "4:00 pm", host: lhs, price: 2),
    Event(sport: .baseball, date: [3,4], time: "4:00 pm", host: lhs, price: 2)
]


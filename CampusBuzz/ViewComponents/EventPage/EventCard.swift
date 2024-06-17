//
//  EventCard.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/2/24.
//

import SwiftUI

struct EventCard: View {
    
    var icon: Image {
        switch event.sport {
        case .xc:
            return Image(systemName: "figure.run")
        case .baseball:
            return Image(systemName: "baseball.fill")
        case .basketball:
            return Image(systemName: "basketball.fill")
        case .football:
            return Image(systemName: "football.fill")
        case .soccer:
            return Image(systemName: "soccerball")
        case .softball:
            return Image(systemName: "figure.softball")
        case .swim:
            return Image(systemName: "figure.pool.swim")
        case .tennis:
            return Image(systemName: "tennis.racket")
        case .track:
            return Image(systemName: "figure.track.and.field")
        }
    }
    
    var title: String {
        switch event.sport {
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
    
    //The card takes what it needs from the event. The rest is information not displayed
    var event: Event
    @ObservedObject var viewModel = ClubViewModel()
    
    var body: some View {
        Button(action: {
            viewModel.showDetailSheet(eventDetails: event)
            viewModel.showingSheet = true
        }, label: {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        icon
                            .foregroundStyle(.secondary)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(title) //Title
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    
                    HStack {
                        Image(systemName: "clock.fill")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                        Text(event.time)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Image(systemName: "dollarsign.square.fill")
                            .font(.title2)
                            .foregroundStyle(.orange)
                        Text("$" + String(event.price) + ".00")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .foregroundStyle(.green)
                        Text(event.host.address)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Text("Hosted by **\(event.host.abbreviatedName)**")
                        .foregroundStyle(.secondary)
                        .font(.caption2)
                        .padding(.bottom)
                }
                .padding(.horizontal)
                .frame(width: 300, height: 200)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    EventCard(event: eventList[0])
}

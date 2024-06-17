//
//  CategoryIcon.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/1/24.
//

import SwiftUI

struct CategoryButton: View {
    
    var sport: Sport
    var icon: Image {
        switch sport {
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
    
    var cardTitle: String {
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
    
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                VStack {
                    icon
                        .padding(.bottom, 5)
    //                    .background(.ultraThinMaterial)
                        .font(.largeTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(cardTitle)
                        .font(.caption)
                        .padding(.top, 1)
                }
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial)
                .foregroundStyle(.foreground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        })
    }
}


#Preview {
    CategoryButton(sport: .soccer)
}

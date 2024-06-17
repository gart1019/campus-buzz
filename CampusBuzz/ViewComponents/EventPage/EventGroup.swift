//
//  EventGroup.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/15/24.
//

import SwiftUI

struct EventGroup: View, Identifiable {
    
    var id = UUID() //Conforming to identifiable
    var month: Int
    var day: Int
    @State var events: [Event] = []
    @ObservedObject var viewModel: ClubViewModel //ViewModel
    
    var body: some View {
        Divider()
            .padding(.top)
        
        HStack {
            Image(systemName: "calendar")
//                .foregroundStyle(.red)
            if events.count > 1 {
                Text("\(month)/\(day)")
                    .font(.title2)
                    .fontWeight(.medium)
            } else {
                Text("\(month)/\(day)")
                    .font(.title2)
                    .fontWeight(.medium)
            }
//            Button(action: {
//                print(events)
//            }, label: {
//                Text("Test")
//            }
//                   )
            Spacer()
        }
        .padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(events) { event in
                    EventCard(event: event, viewModel: viewModel)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .scaleEffect(
                                    x: phase.isIdentity ? 1.0 : 0.9,
                                    y: phase.isIdentity ? 1.0 : 0.9
                                )

                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 50, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
    
    func addEvent(event: Event) -> Void {
        events.append(event)
    }
}



func createSections(organizedEvents: [Int:[Int:[Event]]], viewModel: ClubViewModel) -> [EventGroup] {
    
    //List of events for each month
    var currentStructures: [EventGroup] = []
    
    // (key, value)
    for (month, day) in organizedEvents {
        
        //List of events in a day
        for (dayKey, eventValue) in day {
            let section: EventGroup = EventGroup(month: month, day: dayKey, events: eventValue, viewModel: viewModel)
            for event in eventValue {
                section.addEvent(event: event)
            }
            currentStructures.append(section)
        }
    }
    
    return currentStructures
}



func createDateList(eventList: [Event]) -> [Int:[Int:[Event]]] {
// [ Month : [ Day : [ Events for the day] ]]
    var sortedDates: [Int:[Int:[Event]]] = [:]
    
    for event in eventList {
        if let month = event.date.first {
            let day = event.date[1]
            //The following check for lists within the dictionary and add a list if there is no dictionary found. These lists hold events that correspond with a date
            
            //If the month key is there and contains a value..
            if sortedDates[month] != nil {
                
                
                //Check for a day key with a value of an event list
                if sortedDates[month]?[day] != nil {
                    
                    //There's already a list so it gets added to
                    sortedDates[month]?[day]?.append(event)
                } else {
                    
                    //Add new list entirely because there is no day key with a value found
                    sortedDates[month]?[day] = [event]
                }
            } else { //The month already exists WITH a value (day)
                
                //Add the event to the list contained within the day key
                sortedDates[month] = [day:[event]]
            }
        }
    }
    
    return sortedDates
}






struct AnnouncementSection: View {
    
    var cardTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "newspaper.fill")
                Text("Club News")
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.horizontal)
//            .padding(.top)
            
            NewsCard(title: cardTitle)
        }
    }
}

#Preview {
//    AnnouncementSection(cardTitle: "Card Title")
    EventGroup(month: 10, day: 5, viewModel: ClubViewModel())
}

//#Preview {
//    AnnouncementSection()
//}

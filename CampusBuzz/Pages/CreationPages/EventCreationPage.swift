//
//  EventCreationPage.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/18/24.
//

import SwiftUI

struct EventCreationPage: View {
    
    @State private var eventStart = Date.now
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    
                    GroupBox(label: Text("Event Date"), content: {
                        DatePicker("Select a date for the event", selection: $eventStart, in: Date.now...)
                            .labelsHidden()
                            .datePickerStyle(.graphical)
                    })
                    .frame(width: 310)
                    Button(action: {
                        print(eventStart)
                    }, label: {
                        Text("Button")
                    })
                }
                .scrollIndicators(.never)
                .safeAreaPadding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Create an Event")
                .toolbarBackground(Color.blue, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    
            }
            }
        }
    }
}

//    let calendarView = CalendarView(initialContent: makeContent())
//private func makeContent() -> CalendarViewContent {
//    let calendar = Calendar.current
//    
//    let startDate = calendar.date(from: DateComponents(year: 2020, month: 01, day: 01))!
//    let endDate = calendar.date(from: DateComponents(year: 2025, month: 01, day: 01))!
//    
//    return CalendarViewContent(
//        calendar: calendar,
//        visibleDateRange: startDate...endDate,
//        monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
//    
//}

#Preview {
    EventCreationPage()
}

//
//  EventCard.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/1/24.
//

import SwiftUI

struct NewsCard: View {
    
    var title: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                Image("banner")
                    .resizable()
                    .blur(radius: 3)
                    .aspectRatio(contentMode: .fill)
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 150)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        
    }
}

#Preview {
    NewsCard(title: "Go Lions!")
}

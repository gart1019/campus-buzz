//
//  GroupedView.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/24/24.
//

import SwiftUI

struct GroupedView: View {
    
    var title: String = ""
    var rank: String = "Member"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .lineLimit(1)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Text(rank)
                    .padding(.horizontal)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .frame(width: 40, height: 40)
                .background(.quaternary)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
        }
        .frame(width: 350, height: 80)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    GroupedView(title: "Leander High School", rank: "Owner")
}

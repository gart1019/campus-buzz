//
//  TicketPurchasingSheet.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/22/24.
//
//  This view was created with reference to the 'HotelDetail' in DetailsPro


import SwiftUI

struct PurchaseDetail: View {
    
    @ObservedObject var viewModel: ClubViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .top) {
                    Image("LocationBanner")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 390, height: 320)
                        .clipped()
                    HStack {
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 11)
                }
                .frame(width: 390, height: 320)
                .clipped()
                
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(viewModel.sheetContent?.host.name ?? "") //Host name
                            .font(.system(size: 29, weight: .semibold, design: .default))
                        Spacer()
                        HStack(alignment: .firstTextBaseline, spacing: 3) {
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("3.6") //Rating
                                .foregroundStyle(.secondary)
                        }
                        .font(.system(.subheadline, weight: .medium))
                    }
                    Text("Leander, TX")
                        .font(.system(.callout, weight: .medium))
                    Text("Leander High School is a secondary school in Leander, Texas, United States, and is part of the Leander Independent School District. It was established in 1983 and was the only high school in district, until the establishment of Cedar Park High School in 1998.")
                        .font(.system(.subheadline).width(.condensed))
                        .padding(.vertical)
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                VStack(alignment: .leading, spacing: 15) {
                    Text("HIGHLIGHTS")
                        .kerning(2.0)
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundStyle(.secondary)
                    
                    //Highlights for this location
                    if let highlights = viewModel.sheetContent?.host.highlights {
                        ForEach(Array(highlights.keys), id: \.self) { key in
                            HStack(spacing: 9) {
                                Image(systemName: highlights[key]!)
                                    .foregroundStyle(.blue)
                                    .frame(width: 20)
                                    .clipped()
                                Text(key)
                                Spacer()
                            }
                            .font(.subheadline)
                        }
                    }
                }
                .padding(.horizontal, 24)
                VStack(spacing: 14) {
                    HStack(spacing: 4) {
                        //Pricing
                        Text("$\(viewModel.sheetContent?.price ?? 0)")
                            .font(.headline)
                        Text("per person")
                    }
                    Button(action: {
                        
                    }, label: {
                        Text("Attend")
                            .font(.system(.title3, weight: .medium))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 24)
                            .background(Color.backgroundMain)
                            .foregroundStyle(.white)
                            .mask {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                            }
                    })
                }
                .safeAreaPadding()
            }
        }
    }
}

//struct PurchaseDetailPreview: PreviewProvider {
//    static var previews: some View {
//        PurchaseDetail(event: eventList[0])
//    }
//}

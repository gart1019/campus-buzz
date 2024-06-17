//
//  OnBoardingPage.swift
//  TicketFinderMock2
//
//  Created by Garrett Norman on 5/3/24.
//

import SwiftUI
import SplineRuntime


struct OnBoardingPage: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                ZStack {
                    
                    Render()
                    
                    VStack {
                        Text("Find events, read updates, buy tickets, and more. All in one app.")
                            .font(.headline)
                            .foregroundStyle(.ultraThickMaterial)
                            .frame(height: 200)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            SignUpPage()
                        }, label: {
                            Text("Continue")
                                .frame(width: 300, height: 40)
                                .fontWeight(.bold)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundStyle(.ultraThickMaterial)
                        })
                        
                        .padding(.vertical, 100)
                    }
                    
                }
                .ignoresSafeArea()
            } 
        }
    }
}

#Preview {
    OnBoardingPage()
}


struct OnboardingButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .frame(width: 300, height: 40)
                .fontWeight(.bold)
        })
        .background(.pink)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}


struct Render: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/z7FHMWgyzhRBwqA-bOr5/scene.splineswift")!

        // // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}

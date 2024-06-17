//
//  LoadingView.swift
//  Campus Buzz
//
//  Created by Garrett Norman on 6/7/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Color.white
                
                ProgressView("Loading")
            }
        }
    }
}

#Preview {
    LoadingView()
}

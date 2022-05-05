//
//  VideoListView.swift
//  Africa
//
//  Created by Clément Causer on 05/05/2022.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                } //: LOOP
            } //: LIST
            .listStyle(InsetGroupedListStyle())
                .navigationTitle("Videos")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }

            }
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Clément Causer on 05/05/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    var selectedVideo: String
    var videoTitle: String

    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4")) {
//                Text(videoTitle)
            }
                .overlay(Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        } //: VSTACK
        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideo: "lion", videoTitle: "Lion")
        }
    }
}

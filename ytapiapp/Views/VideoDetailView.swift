//
//  VideoDetailView.swift
//  ytapiapp
//
//  Created by Kobe Shen on 2024-07-07.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack (alignment: .leading) {
                
                // Condigure video player
                let youTubePlayer = YouTubePlayer(
                    source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
                    configuration: .init(
                        autoPlay: false
                    )
                )
                
                // Video Player
                YouTubePlayerView(youTubePlayer)
                    .frame(width: proxy.size.width, height: proxy.size.width/1.77778)
                
                //Title and Description
                ScrollView {
                    VStack (alignment: .leading, spacing: 30) {
                        Text(video.snippet?.title ?? "")
                            .font(.headline)
                            .bold()
                        Text(video.snippet?.description ?? "")
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
        
        
    }
}


//
//  VideoRowView.swift
//  ytapiapp
//
//  Created by Kobe Shen on 2024-07-07.
//

import SwiftUI

struct VideoRowView: View {
    
    var video: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? "") {
                AsyncImage(url: url) { image in
                    // Image that is displayed
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                }
                
            }
            Text(video.snippet?.title ?? "")
                .bold()
        }
        .padding(.vertical)
    }
    
}


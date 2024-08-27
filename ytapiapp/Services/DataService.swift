//
//  DataService.swift
//  ytapiapp
//
//  Created by Kobe Shen on 2024-07-07.
//

import Foundation

struct DataService {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideos() async -> [Video] {
        
        // Check if Api key is there
        guard apiKey != nil else {
            return [Video]()
        }
        
        // Create the URL
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLH_XbWBXSyQBZ0VLVFXAQyuLpHNtM4k3C&maxResults=20&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url = url {
            // Create the request
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // Send the request
            do {
                let (data, _) = try await session.data(for: request)
                
                // Parse the data
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                
                return playlist.items
            }
            catch {
                print(error)
            }
            
            
            // Parse
        }
        
        
        
        return [Video]()
    }
    
}

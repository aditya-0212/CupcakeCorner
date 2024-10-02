//
//  AppleITuneSwiftUI.swift
//  CupcakeCorner
//
//  Created by APPLE on 14/07/24.
//

import SwiftUI
struct Response:Codable{
    var results = [Result]()
}

struct Result:Codable{
    var trackId:Int
    var trackName:String
    var collectionName:String
}
struct AppleITuneSwiftUI: View {
    @State private var results = [Result]()
    var body: some View {
        VStack(alignment:.leading){
            List(results,id: \.trackId){ track in
                Text(track.trackName)
                    .font(.headline.weight(.bold))
                Text(track.collectionName)
                   
            }
        }
        .task{
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from:url)
            if let decoded = try? JSONDecoder().decode(Response.self,from: data){
                results = decoded.results
            }
           
            }
     catch{
            print("invalid url")
        }
    }
}

#Preview {
    AppleITuneSwiftUI()
}


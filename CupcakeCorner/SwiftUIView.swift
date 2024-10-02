//
//  SwiftUIView.swift
//  CupcakeCorner
//
//  Created by APPLE on 12/07/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                }else if phase.error != nil{
                    Text("there is something error loading the image")
                }
                else{
                    ProgressView()
                }
            }
            .frame(width:200, height:200)
               
        }
}
}

#Preview {
    SwiftUIView()
}

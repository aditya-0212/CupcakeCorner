//
//  DisableUIView.swift
//  CupcakeCorner
//
//  Created by APPLE on 12/07/24.
//

import SwiftUI

struct DisableUIView: View {
    @State private var username = ""
    @State private var emailId = ""
    var body: some View {
        Form{
            Section{
                TextField("enter username",text: $username)
                    .autocapitalization(.none)
                TextField("enter emailId",text: $emailId)
                    .autocapitalization(.none)
            }
            Section{
                Button("login"){
                    print("you are login into the acount....")
                }
                
            }
            .disabled(username.count < 5 || emailId.count < 5)
        }
        
    }
}

#Preview {
    DisableUIView()
}

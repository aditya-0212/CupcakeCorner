//
//  AddressUIView.swift
//  CupcakeCorner
//
//  Created by APPLE on 15/07/24.
//

import SwiftUI

struct AddressUIView: View {
   @Bindable var order:Order
    @State var address:Address
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Enter your name",text: $address.name)
                        .textInputAutocapitalization(.none)
                    TextField("Enter the street",text: $address.streetAddress)
                        .textInputAutocapitalization(.none)
                    TextField("Enter your city",text: $address.city)
                        .textInputAutocapitalization(.none)
                    TextField("Enter zip code",text: $address.zip)
                        .textInputAutocapitalization(.none)
                }
                Section{
                    NavigationLink("Check OUt"){
                          CheckOutView(order: order)
                      }
                }
//                .disabled(order.hashValidAddress == false)
            }
//            .toolbar{
//                Button("Reset"){
//                    order.name = ""
//                    order.streetAddress = ""
//                    order.city = ""
//                    order.zip = ""
//                }
//            }
        .navigationTitle("Delivery Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            if let savedItems = UserDefaults.standard.data(forKey: "Address"){
                if let decodedItems = try? JSONDecoder().decode(Address.self, from: savedItems){
                    address = decodedItems
                }
            }
        }
        }
    }
}

#Preview {
    AddressUIView(order: Order(), address: Address(name: "", streetAddress: "", city: "", zip: ""))
}

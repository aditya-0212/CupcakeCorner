//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by APPLE on 12/07/24.
//

import SwiftUI

struct ContentView:View {
    @State private var order = Order()
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type",selection: $order.type){
                        ForEach(Order.types.indices,id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes:\(order.quantity)",value: $order.quantity,in: 3...20)
                    
                    
                }
                Section{
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())

                       if order.specialRequestEnabled {
                           Toggle("Add extra frosting", isOn: $order.extraFrosting)

                           Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                       }
                    
                }
                
                Section{
                    NavigationLink("Delivery Details"){
//                        AddressUIView(order:order, address: <#Address#>)
                    }
                }
            }
            .toolbar{
                Button("Reset"){
                    order.type = 0
                    order.quantity = 3
                    order.specialRequestEnabled = false
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}

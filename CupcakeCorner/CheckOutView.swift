//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by APPLE on 16/07/24.
//

import SwiftUI

struct CheckOutView: View {
    @Bindable var order:Order
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Section{
                        AsyncImage(url: URL(string: "https://media.istockphoto.com/id/167120918/photo/pink-and-white-frosted-cupcake-isolated-on-white.jpg?s=612x612&w=0&k=20&c=o1xFPaMLhmq7y-LczWkePTOP1yotfx6OOT9VHcDNha0="),scale: 3){Image in
                            Image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height:223)
                                .clipShape(.rect(cornerRadius: 20))
                                .shadow(radius:5)
                        } placeholder: {
                            ProgressView()
                        }
                    }
//                    .frame(height:223)
//                    .padding(.horizontal,2)
//                    .background(.secondary)
                    
                    
                    Section{
                        Text("Your total order is \(order.cost)")
                            .font(.title.weight(.bold))
                    }
                    .padding()
                    Section{
                        Button("Place Order"){
                            Task{
                                await placeOrder()
                            }
                        }
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert(alertTitle,isPresented: $showAlert){
                Button("Ok"){}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func placeOrder() async {
        guard let encoded  = try? JSONEncoder().encode(order) else{
            print("order object is not encoded")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpMethod = "POST"
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            if let decoded = try? JSONDecoder().decode(Order.self, from: data){
                alertTitle = "congratulations"
                alertMessage = "your order of \(Order.types[decoded.type]) is on the way which has quantity \(decoded.quantity)X"
                showAlert = true
            }
        }
        catch{
            alertTitle = "Error"
           alertMessage = "checkOut Failed:\(error.localizedDescription)"
            showAlert = true
        }
    }
}

#Preview {
    CheckOutView(order:Order())
}

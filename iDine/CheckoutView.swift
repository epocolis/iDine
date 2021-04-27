//
//  CheckoutView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-26.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    @State private var showingPaymentAlert = false
    private var totalPrice = "100"
    
    let tipAmounts = [0,10, 15,20,25]
    
    
    let paymentTypes = ["Cash","Credit Card", "iDine Points"]
    var body: some View {
        Form{
            Section {
                Picker("How do you want to pay?",selection:$paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                        
                    }
                }
                
                Toggle("add iDine loyalty card",isOn:$addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID",text: $loyaltyNumber)
                }
                
                
            }
            
            Section(header: Text("Add a tip?").padding(.leading, 15)){
                Picker("Percentage", selection:$tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section(header:Text("TOTAL: $100").padding(.leading, 15)){
                Button("Confirm order"){
                    // place the order
                    showingPaymentAlert.toggle()
                }
            }
            
            
            
        }.navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title:Text("Order confirmed"),message:
                    Text("Your total was \(totalPrice)"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}

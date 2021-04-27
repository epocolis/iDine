//
//  OrderView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-26.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            List {
                Section {
                    ForEach(order.items){
                        item in HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                    
                }
                
                Section {
                    NavigationLink(destination:CheckoutView()){
                        Text("Place Order")
                    }
                    
                }.disabled(order.items.isEmpty)
            }.navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar{
               EditButton()
            }
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

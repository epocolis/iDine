//
//  OrderView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-26.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
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
                    }
                }
                
                Section {
                    NavigationLink(destination:Text("Check out")){
                        Text("Place Order")
                    }
                    
                }
            }.navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

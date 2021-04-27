//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 If you look in the SwiftUI preview window you’ll see the standard iOS picker interface – a spinning wheel of
 options. By default it will show the first option, because it reads the value of paymentType, which we set to
 “Cash”. However, when the user moves the wheel their selection changes – they might select “Credit Card” or
 “iDine Points” instead of cash.

 So, this picker doesn’t just read the value of paymentType, it also writes the value. This is what’s called a
 two-way binding, because any changes to the value of paymentType will update the picker, and any changes to the
 picker will update paymentType.

 This is where the dollar sign comes in: Swift property wrappers use that to provide two-way bindings to their
 data, so when we say $paymentType SwiftUI will write the value using the property wrapper, which will in turn
 stash it away and cause the UI to refresh automatically.

 At first glance all these @ and $s might seem a bit un-Swifty, and it’s true that if you’re coming from UIKit you
 might not used to working in this way. However, they allow us to get features that would otherwise require a lot
 of hassle:

 Without @State we wouldn’t be able to change properties in our structs, because structs are fixed values.
 Without StateObject we wouldn’t be able to create classes that stay alive for the duration of our app.
 Without @EnvironmentObject we wouldn’t be able to receive shared data from elsewhere in our app.
 Without ObservableObject we wouldn’t be notified when an external value changes.
 Without $property two-way bindings we would need to update values by hand.
 Anyway, that’s our basic picker complete, so if we return to OrderView.swift we can update our code so that it
 shows our new CheckoutView struct rather than some text saying “Checkout”.

 */

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from:"menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu){ section in
                    Section(header:Text(section.name)){
                        
                        ForEach(section.items){ item in
                            NavigationLink(destination: ItemDetail(item:item)){
                                ItemRow(item:item) }
                            
                        }
                        
                    }
                }
            }.navigationTitle(Text("Menu"))
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

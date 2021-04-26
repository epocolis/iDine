//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 So far we’ve let users browse the menu, add items to an order, then see their total order. What we haven’t done
 is create a mechanism to confirm that order, so that’s our next job.

 While this won’t actually send anything off to a server somewhere, I do at least want to use this opportunity to
 show off one of SwiftUI’s most impressive features: forms.

 Forms are containers like stacks, but they are specifically designed for things like settings screens and user
 input – anywhere the user might want to make several choices in one place. Forms do a few interesting things as
 you’ll see, and along the way I’ll be showing you how to use common UI controls like pickers, text fields,
 segmented controls, and more.

 Now I know what you’re thinking: surely text fields are easy? Well, they aren’t hard, but they also don’t work
 like you’re used to in UIKit.

 To get things up and running let’s create a new CheckoutView struct that we’ll present when Place Order is
 pressed. Press Cmd+N to add a new SwiftUI View called “CheckoutView”, then give it the same @EnvironmentObject
 property the other views have:

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

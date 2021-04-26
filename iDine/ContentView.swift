//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 We want to let folks place an order for pick up by selecting items and adding them to a cart. I already gave you a dedicated Order class that holds an array of items, so we’re going to add items to that then show them in a dedicated order view.

 But there’s a catch: if we’re adding things inside ItemDetail, how can we show them in an entirely separate OrderView? More importantly, how can we make sure both of these two update each other as things change?

 Well, SwiftUI has a quite brilliant solution called environment objects. These are objects that our views can use freely, but don’t create or manage – they get created elsewhere, and carry on existing after the view has gone away.

 In this app, we’re going to create an instance of our order when the app launches, then pass it into our content view. Any view that is inside that content view – anything that can call the content view its ancestor – will automatically gain access to that environment object. Even better, when any view changes it, all other places automatically update.


 
 
 
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

//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 So, what did we actually just do?

 Well, we want a way for users to look at items in the menu and add them to an order. But we also want their
 ordered items to appear somewhere else in the app.

 Environment objects are SwiftUI’s way of sharing data across many places, but by themselves they aren’t a
 complete solution because it would be easy for different parts of our UI to show different things based on when
 they loaded. With the ObservableObject protocol we’ve given our Order class the ability to announce that it has
 changed, and we can now make SwiftUI watch for those announcements and reload the UI.

 We just created an instance of Order and placed it into the environment. As a result, any view that comes from
 ContentView can read that order back out and manipulate it somehow.

 We want to add items to our order from the detail screen, so head back to ItemDetail.swift and give it this
 property:

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

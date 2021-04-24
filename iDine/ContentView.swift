//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 Just having names of menu items written out isn’t particularly appealing for a restaurant, so let’s make those items look good.

 First, though, an important lesson: SwiftUI is designed to be composable, which means you can make views out of any other views you like. We have a simple text view for our items right now, Text(item.name), but we’re going to add much more in there to bring it to life. While we could put that directly into ContentView.swift, it becomes long and hard to read.

 A better idea is to make a new view type that we can embed inside ContentView, and SwiftUI is designed to make this both easy (it takes only 30 seconds to learn) and extremely fast (it has almost zero performance impact).
 
 
 
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
                            ItemRow(item:item)
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

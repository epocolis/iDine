//
//  ContentView.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//
/*
 
 When you want to show two separate views with SwiftUI, the easiest and most user-intuitive approach is with a tab
 bar across the bottom of our app. In our case, that means we’ll put our menu view in one tab and the active order
 in another. SwiftUI gives us a TabView for just this purpose, and it works much like a UITabBarController.

 Press Cmd+N to create a new SwiftUI View, calling it “MainView”. Creating tabs is as easy as putting different
 views inside an instance of TabView, but in order to add an image and text to the tab bar item of each view we
 need to use the tabItem() modifier.

 Let’s start with the code – change MainView to this:

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

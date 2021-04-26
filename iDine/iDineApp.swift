//
//  iDineApp.swift
//  iDine
//
//  Created by Leotis buchanan on 2021-04-24.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

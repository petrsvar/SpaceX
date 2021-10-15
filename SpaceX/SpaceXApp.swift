//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.
//

import SwiftUI

// [1]
// Creates the instance of NetworkController (located in Networking/NetworkController.swift)
// and opens ContentView (located in Views/ContentView.swift)
// --> Views/ContentView [2]

@main
struct SpaceXApp: App {
    @StateObject private var networkController = NetworkController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NetworkController())
        }
    }
}

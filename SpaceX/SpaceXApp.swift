//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.


//  [1]
//  Creates the instance of NetworkController (located in Networking/NetworkController.swift).
//  Opens ContentView (located in Views/ContentView.swift).
//  --> Views/ContentView [2]


import SwiftUI

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

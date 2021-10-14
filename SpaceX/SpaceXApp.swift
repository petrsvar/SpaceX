//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.
//

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

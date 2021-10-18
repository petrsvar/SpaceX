//
//  ContentView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 09/10/2021.

// [2]
// Connect SwiftUI interface to the NetworkController.
// Add navigation between the ListView (located in Views/ListView.swift)
// and DetailView (located in Views/DetailView.swift).
// Start ListView (located in Views/ListView.swift).
// Fetch JSOM with launches (networkController.fetchLaunches) on appear.
// --> Views/ListView [3]
// --> Networking/NetworkController [7]

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var networkController: NetworkController
    
    var body: some View {
        NavigationView {
            ListView(launches: networkController.launches,
                     errorInfo: networkController.errorInfo,
                     networkStatus: networkController.networkStatus)
        }.onAppear(perform: networkController.fetchLaunches)
    }
}

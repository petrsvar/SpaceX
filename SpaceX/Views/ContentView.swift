//
//  ContentView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 09/10/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var networkController: NetworkController
    
    var body: some View {
        NavigationView {
            ListView(launches: networkController.launches)
        }.onAppear(perform: networkController.fetchLaunches)
    }
}

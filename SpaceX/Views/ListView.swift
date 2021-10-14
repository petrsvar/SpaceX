//
//  ListView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.
//

import SwiftUI

struct ListView: View {
    let launches: [Launch]
    
    var body: some View {
        VStack() {
            List {
                ForEach(launches) { launch in
                    NavigationLink(destination: DetailView(launch: launch)) {
                        Row(title: launch.missionName,
                            subtitle1: launch.date.formatted,
                            subtitle2: launch.succeeded.formatted)
                    }
                }
            }
            .navigationBarTitle("Launches")
            .background(Color.pink)
        }
    }
}

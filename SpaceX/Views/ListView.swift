//
//  ListView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.
//

import SwiftUI

// [3]
// Show a list of launches using a row definition (Views/Row.swift)
// A tap on the row opens a detail view (Views/DetailView.swift)
// --> Views/Row.swift [4]
// --> Views/DetailView.swift [5]

struct ListView: View {
    let launches: [Launch]
    
    var body: some View {
        VStack() {
            List {
                ForEach(launches) { launch in
                    NavigationLink(destination: DetailView(launch: launch)) {
                        Row(title: launch.missionName,
                            
                            // Show formatted data
                            // See Data/Formatting.swift for details
                            // --> Data/Formatting.swift [6]
                            
                            subtitle1: launch.date.formatted,
                            subtitle2: launch.succeeded.formatted)
                    }
                }
            }
            .navigationBarTitle("Launches")
        }
    }
}

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
// Show an alert if data is not loaded
// --> Views/Row.swift [4]
// --> Views/DetailView.swift [5]

struct ListView: View {
    let launches: [Launch]
    var errorInfo: ErrorInfo
    @State var networkProblem = true
    
    var body: some View {
        VStack() {
            
            //Show the alert
            if (errorInfo.showAlert) {
                Spacer()
                    .alert(isPresented: $networkProblem) {
                        Alert(title: Text(errorInfo.title),
                              message: Text(errorInfo.message),
                              dismissButton: .default(Text("OK")))
               }
            }
            
            //Show the list of launches
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

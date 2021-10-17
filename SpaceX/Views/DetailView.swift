//
//  DetailView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.


//  [5]
//  Show details about the launch


import SwiftUI

struct DetailView: View {
    let launch: Launch
    
    var body: some View {
        
        VStack(spacing: 8.0) {
            Text(launch.missionName)
                .font(.largeTitle)
                .bold()
            VStack ( alignment: .leading) {
                Text(launch.date.formatted)
                
                // Show formatted data
                // See Data/Formatting.swift for details
                // --> Data/Formatting.swift [6]
                
                Text(launch.succeeded.formatted).padding(.bottom, 2)
                Text(launch.details)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .foregroundColor(.gray)
            .font(.subheadline)
            
            Spacer()
        }
        .padding(.top, 32.0)
        .padding(.bottom, 40.0)
    }
}

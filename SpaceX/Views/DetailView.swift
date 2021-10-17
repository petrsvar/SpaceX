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
        
        VStack(spacing: 0.0) {
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
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .foregroundColor(.gray)
            .font(.subheadline)
            .padding(.top, 20.0)
            .padding(.bottom, 40.0)
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
        }
    }
}

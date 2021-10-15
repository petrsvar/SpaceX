//
//  Row.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 08/10/2021.
//

import SwiftUI

// [4]
// Prepare a structure of the row for the list (View/ListView.swift)

struct Row: View {
    let title: String
    let subtitle1: String
    let subtitle2: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0) {
                Text(title).font(.headline)
                Text(subtitle1).font(.subheadline).foregroundColor(.gray)
                Text(subtitle2).font(.subheadline).foregroundColor(.gray)
        }.padding(.vertical, 16.0)
    }
}

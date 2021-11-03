//
//  ListView.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 01/10/2021.


//  [3]
//  Show a list of launches using a row definition (Views/Row.swift)
//  A tap on the row opens a detail view (Views/DetailView.swift)
//  Show an alert if data is not loaded
//  Search in launch names
//  --> Views/Row.swift [4]
//  --> Views/DetailView.swift [5]


import SwiftUI

struct ListView: View {
    let launches: [Launch]
    let errorInfo: ErrorInfo
    let networkStatus: NetworkStatus
    @State var networkProblem: Bool = true
    @State var searchText: String = ""
    
    var body: some View {
        ZStack() {

            // Bottom layer
            VStack() {
                Spacer()
                //Show the alert
                if (errorInfo.showAlert) {
                    Spacer()
                        .alert(isPresented: $networkProblem) {
                            Alert(title: Text(errorInfo.title),
                                  message: Text(errorInfo.message),
                                  dismissButton: .default(Text("OK")))
                   }
                }
                
                // Search bar
                SearchBar(text: $searchText)
                    .padding(.top, -30)
                
                // List of launches
                List {
                    
                    // Create array of filtered launches by name
                    let filteredLaunches = launches.filter({ searchText.isEmpty ? true : $0.missionName.contains(searchText) })
                    
                    // Show the list of filtered launches
                    ForEach(filteredLaunches) { launch in
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
                .padding(.leading, 1)
                .listStyle(InsetListStyle())
                .navigationBarTitle("Launches")
            }
            
            // Top layer
            VStack() {
                // Show spinner wheel until server responses with the 200 code (JSON served)
                ProgressView().opacity(networkStatus.statusCode == 200  ? 0 : 1)
            }
        }
    }
}

// Custom made search bar to keep compatibility with iOS 13 and 14
struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            TextField("Search mission name", text: $text)
                .padding(7)
                .padding(.top, 0)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(18)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .padding(.bottom, 2)
                .onTapGesture {
                    self.isEditing = true
                }
        }
        .padding(.top, 16)
        .padding(.trailing, 7)
        .padding(.bottom, 2)
        .padding(.leading, 5)
    }
}



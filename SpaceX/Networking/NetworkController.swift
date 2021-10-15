//
//  NetworkController.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 09/10/2021.
//

import Foundation

// [7]
// Fetch all past launches from api.spacexdata.com v4
// See more details on the API at https://github.com/r-spacex/SpaceX-API
// Decode JSON data using customised Codable decoder
// Store data in the data model (Data/Launch.swift)
// --> Networking/NetworkRequest.swift [8]
// --> Data/Launch.swift [9]


class NetworkController: ObservableObject {
    @Published var launches: [Launch] = []
    
    func fetchLaunches() {
        let url = URL(string: "https://api.spacexdata.com/v4/launches/past")!
        let request = NetworkRequest(url: url)

        request.execute { [weak self] (data) in
            if let data = data {
                self?.decode(data)
            }
        }
    }
}

private extension NetworkController {
    
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        launches = (try? decoder.decode([Launch].self, from: data)) ?? []
    }
}


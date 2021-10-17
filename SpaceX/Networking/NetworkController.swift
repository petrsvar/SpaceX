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
// Check the server status code and adjust error messages if applicable
// --> Networking/NetworkRequest.swift [8]
// --> Data/Launch.swift [9]
// --> Data/Errors.swift [10]


class NetworkController: ObservableObject {
    @Published var launches: [Launch] = []
    @Published var errorInfo = ErrorInfo(showAlert: false, id: 0, title: "Error", message: "")
    
    func fetchLaunches() {
        let url = URL(string: "https://api.spacexdata.com/v4/launches/past")!
        let request = NetworkRequest(url: url)

        request.execute { [weak self] (data, code) in
            if let data = data {
                self?.decode(data)
            }
            
            if let code = code {
                switch code {
                case 200:
                    self?.errorInfo.showAlert = false
                case 0:
                    self?.errorInfo.showAlert = true
                    self?.errorInfo.id = 1
                    self?.errorInfo.message = "Your phone doesn't seem to be conected to Internet."
                default:
                    self?.errorInfo.showAlert = true
                    self?.errorInfo.id = 2
                    self?.errorInfo.message = "There is some problem on the server. Try again later, please"
                }
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


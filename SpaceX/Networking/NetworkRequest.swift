//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 07/10/2021.
//

import Foundation
import Alamofire

// [8]
// Download JSON data from server,
// validate for the status code,
// return JSON back to the NetworkController (Data/NetworkController.swift)

class NetworkRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(withCompletion completion: @escaping (Data?) -> Void) {
        Session.default.request(url)
            .validate(statusCode: 200..<300)
            .response{
                response in completion(response.data)
            }
    }
}

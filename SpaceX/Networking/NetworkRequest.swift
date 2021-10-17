//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 07/10/2021.
//

import Foundation
import Alamofire
import SwiftUI

// [8]
// Download JSON data from server,
// validate for the status code,
// return JSON back to the NetworkController (Data/NetworkController.swift)

class NetworkRequest {

    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(withCompletion completion: @escaping (Data?, Int?) -> Void) {
        
        Session.default.request(url).response{
            response in completion(response.data, response.response?.statusCode ?? 0)
                // let statusCode = response.response?.statusCode ?? 0
        }
    }
}

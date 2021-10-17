//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 07/10/2021.


//  [8]
//  Download JSON data from server,
//  validate for the status code,
//  return JSON back to the NetworkController (Data/NetworkController.swift)


import Foundation
import Alamofire

class NetworkRequest {

    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(withCompletion completion: @escaping (Data?, Int?) -> Void) {
        
        Session.default.request(url).response{
            response in completion(response.data, response.response?.statusCode ?? 0)
        }
    }
}

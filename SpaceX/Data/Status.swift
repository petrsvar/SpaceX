//
//  Errors.swift
//  SpaceX
//
//  Created by Twice Upon on 16/10/2021.


//  [10]
//  Data model for networking eroor messages. The "id" is not in use yet.

import Foundation

struct ErrorInfo: Identifiable {

    var id: Int
    var showAlert: Bool // true to show alert, false to hide alert
    var title: String  // alert title
    var message: String // alert message
}

struct NetworkStatus: Identifiable {
    
    var id: Int
    var status: String // can be "idle", "loading", "succeeded", "failed"
    var statusCode: Int // server status code
}

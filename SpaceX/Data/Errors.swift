//
//  Errors.swift
//  SpaceX
//
//  Created by Twice Upon on 16/10/2021.


//  [10]
//  Data model for networking eroor messages. The "id" is not in use yet.

import Foundation

struct ErrorInfo: Identifiable {

    var showAlert: Bool
    var id: Int
    var title: String
    var message: String
}

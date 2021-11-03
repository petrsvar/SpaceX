//
//  Launch.swift
//  SpaceX
//
//  Created by Petr Svarovsky on 03/10/2021.


//  [9]
//  Data model for the app.
//  The "details" filed is not mandatory, therefore teh value is issing sometimes.
//  The missing value is replaced by the empty string ("") for the consistency.


import Foundation

struct Launch: Identifiable {
    let id: Int
    let missionName: String
    let date: Date
    let succeeded: Bool
    let details: String
    let rocket: String
    // let rocketName: String
}

extension Launch: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "flight_number"
        case missionName = "name"
        case date = "date_utc"
        case succeeded = "success"
        case details = "details"
        case rocket = "rocket"
}
    
    // Custom initializer to fix sometimes missing details
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        missionName = try container.decode(String.self, forKey: .missionName)
        date = try container.decode(Date.self, forKey: .date)
        succeeded = (try container.decodeIfPresent(Bool.self, forKey: .succeeded)) ?? false
        details = (try container.decodeIfPresent(String.self, forKey: .details)) ?? "" // replace nil by ""
        rocket = try container.decode(String.self, forKey: .rocket)
    }
}

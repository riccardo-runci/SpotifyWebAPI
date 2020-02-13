//
//  UserTopTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userTopTracks = try? newJSONDecoder().decode(UserTopTracks.self, from: jsonData)


// MARK: - UserTopTracks
public struct UserTopTracks: Codable {
    let items: [TracksItem]
    let total, limit, offset: Int
    let href: String
    let previous: String?
    let next: String?
}

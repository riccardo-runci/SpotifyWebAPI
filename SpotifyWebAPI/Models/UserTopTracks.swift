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
    public let items: [TracksItem]
    public let total, limit, offset: Int
    public let href: String
    public let previous: String?
    public let next: String?
}

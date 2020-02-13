//
//  UserSavedTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userSavedTracks = try? newJSONDecoder().decode(UserSavedTracks.self, from: jsonData)

// MARK: - UserSavedTracks
public struct UserSavedTracks: Codable {
    let href: String
    let items: [UserSavedTracksItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

// MARK: - Item
public struct UserSavedTracksItem: Codable {
    let addedAt: Date
    let track: TracksItem

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case track
    }
}

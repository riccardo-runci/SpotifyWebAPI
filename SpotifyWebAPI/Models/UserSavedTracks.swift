//
//  UserSavedTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   public let userSavedTracks = try? newJSONDecoder().decode(UserSavedTracks.self, from: jsonData)

// MARK: - UserSavedTracks
public struct UserSavedTracks: Codable {
    public let href: String
    public let items: [UserSavedTracksItem]
    public let limit: Int
    public let next: String?
    public let offset: Int
    public let previous: String?
    public let total: Int
}

// MARK: - Item
public struct UserSavedTracksItem: Codable {
    public let addedAt: Date
    public let track: TracksItem

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case track
    }
}

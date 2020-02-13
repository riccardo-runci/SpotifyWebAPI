//
//  UserRecenlyPlayed.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userRecentlyPlayed = try? newJSONDecoder().decode(UserRecentlyPlayed.self, from: jsonData)


// MARK: - UserRecentlyPlayed
public struct UserRecentlyPlayed: Codable {
    public let items: [UserRecentlyPlayedItems]
    public let next: String
    public let cursors: Cursors
    public let limit: Int
    public let href: String
}

// MARK: - Item
public struct UserRecentlyPlayedItems: Codable {
    public let track: TracksItem
    public let playedAt: String
    public let context: Context?

    enum CodingKeys: String, CodingKey {
        case track
        case playedAt = "played_at"
        case context
    }
}

// MARK: - Context
public struct Context: Codable {
    public let type: String
    public let externalUrls: ExternalUrls
    public let href: String
    public let uri: String

    enum CodingKeys: String, CodingKey {
        case type
        case externalUrls = "external_urls"
        case href, uri
    }
}

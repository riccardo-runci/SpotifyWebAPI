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
    let items: [UserRecentlyPlayedItems]
    let next: String
    let cursors: Cursors
    let limit: Int
    let href: String
}

// MARK: - Item
public struct UserRecentlyPlayedItems: Codable {
    let track: TracksItem
    let playedAt: String
    let context: Context?

    enum CodingKeys: String, CodingKey {
        case track
        case playedAt = "played_at"
        case context
    }
}

// MARK: - Context
public struct Context: Codable {
    let type: String
    let externalUrls: ExternalUrls
    let href: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case type
        case externalUrls = "external_urls"
        case href, uri
    }
}

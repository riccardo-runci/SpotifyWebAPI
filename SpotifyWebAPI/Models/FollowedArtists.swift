//
//  FollowedArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   public let followedArtists = try? newJSONDecoder().decode(FollowedArtists.self, from: jsonData)


// MARK: - FollowedArtists
public struct FollowedArtists: Codable {
    public let artists: Artists
}

// MARK: - Artists
public struct Artists: Codable {
    public let items: [Artist]
    public let next: String?
    public let total: Int
    public let cursors: Cursors?
    public let limit: Int
    public let href: String
}

// MARK: - Cursors
public struct Cursors: Codable {
    public let after: String?
    public let before: String?
}

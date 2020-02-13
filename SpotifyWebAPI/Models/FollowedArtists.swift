//
//  FollowedArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let followedArtists = try? newJSONDecoder().decode(FollowedArtists.self, from: jsonData)


// MARK: - FollowedArtists
public struct FollowedArtists: Codable {
    let artists: Artists
}

// MARK: - Artists
public struct Artists: Codable {
    let items: [Artist]
    let next: String?
    let total: Int
    let cursors: Cursors?
    let limit: Int
    let href: String
}

// MARK: - Cursors
public struct Cursors: Codable {
    let after: String?
    let before: String?
}

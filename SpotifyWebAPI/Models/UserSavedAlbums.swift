//
//  UserSavedAlbums.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userSavedAlbums = try? newJSONDecoder().decode(UserSavedAlbums.self, from: jsonData)

// MARK: - UserSavedAlbums
public struct UserSavedAlbums: Codable {
    let href: String
    let items: [UserSavedAlbumsItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

// MARK: - UserSavedAlbumsItem
public struct UserSavedAlbumsItem: Codable {
    let addedAt: Date
    let album: Album

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case album
    }
}

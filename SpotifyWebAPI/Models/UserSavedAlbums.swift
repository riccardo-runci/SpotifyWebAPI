//
//  UserSavedAlbums.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   public let userSavedAlbums = try? newJSONDecoder().decode(UserSavedAlbums.self, from: jsonData)

// MARK: - UserSavedAlbums
public struct UserSavedAlbums: Codable {
    public let href: String
    public let items: [UserSavedAlbumsItem]
    public let limit: Int
    public let next: String?
    public let offset: Int
    public let previous: String?
    public let total: Int
}

// MARK: - UserSavedAlbumsItem
public struct UserSavedAlbumsItem: Codable {
    public let addedAt: Date
    public let album: Album

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case album
    }
}

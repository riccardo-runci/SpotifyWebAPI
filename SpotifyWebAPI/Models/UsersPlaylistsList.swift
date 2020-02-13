//
//  UsersPlaylistList.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let usersPlaylistsList = try? newJSONDecoder().decode(UsersPlaylistsList.self, from: jsonData)


// MARK: - UsersPlaylistsList
public struct UsersPlaylistsList: Codable {
    public let href: String
    public let items: [PlaylistItem]
    public let limit: Int
    public let next: String?
    public let offset: Int
    public let previous: String?
    public let total: Int
}

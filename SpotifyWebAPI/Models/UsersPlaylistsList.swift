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
    let href: String
    let items: [PlaylistItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

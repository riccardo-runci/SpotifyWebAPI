//
//  CategorysPlaylists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   public let categorysPlaylists = try? newJSONDecoder().decode(CategorysPlaylists.self, from: jsonData)


// MARK: - CategorysPlaylists
public struct CategorysPlaylists: Codable {
    public let playlists: Playlists
}

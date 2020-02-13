//
//  FeaturedPlaylistsList.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let featuredPlaylistsList = try? newJSONDecoder().decode(FeaturedPlaylistsList.self, from: jsonData)


// MARK: - FeaturedPlaylistsList
public struct FeaturedPlaylistsList: Codable {
    let message: String
    let playlists: Playlists
}

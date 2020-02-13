//
//  Playlists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Playlists
public struct Playlists: Codable {
    let href: String
    let items: [PlaylistItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String
    let total: Int
}

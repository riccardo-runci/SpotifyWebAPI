//
//  Tracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Tracks
public struct Tracks: Codable {
    let href: String
    let items: [TracksItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

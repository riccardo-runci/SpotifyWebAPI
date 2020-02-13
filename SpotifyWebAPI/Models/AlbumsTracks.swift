//
//  AlbumsTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let albumsTracks = try? newJSONDecoder().decode(AlbumsTracks.self, from: jsonData)

import Foundation

// MARK: - AlbumsTracks
public struct AlbumsTracks: Codable {
    let href: String
    let items: [TracksItem]
    let limit: Int
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int
}

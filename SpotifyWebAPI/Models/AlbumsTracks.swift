//
//  AlbumsTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   public let albumsTracks = try? newJSONDecoder().decode(AlbumsTracks.self, from: jsonData)

import Foundation

// MARK: - AlbumsTracks
public struct AlbumsTracks: Codable {
    public let href: String
    public let items: [TracksItem]
    public let limit: Int
    public let next: String?
    public let offset: Int?
    public let previous: String?
    public let total: Int
}

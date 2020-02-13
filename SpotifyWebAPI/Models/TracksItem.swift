//
//  TrackItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct TracksItem: Codable {
    let album: Album?
    let artists: [Artist]
    let popularity: Int?
    let availableMarkets: [String]?
    let externalIDS: ExternalIDS?
    let discNumber, durationMS: Int
    let explicit: Bool
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let isLocal: Bool
    let isPlayable: Bool?
    let name: String
    let previewURL: String?
    let trackNumber: Int
    let type: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case artists, album
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalUrls = "external_urls"
        case externalIDS = "external_ids"
        case href, id
        case isLocal = "is_local"
        case isPlayable = "is_playable"
        case name
        case popularity
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
    }
}

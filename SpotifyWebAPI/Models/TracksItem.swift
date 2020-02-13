//
//  TrackItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct TracksItem: Codable {
    public let album: Album?
    public let artists: [Artist]
    public let popularity: Int?
    public let availableMarkets: [String]?
    public let externalIDS: ExternalIDS?
    public let discNumber, durationMS: Int
    public let explicit: Bool
    public let externalUrls: ExternalUrls
    public let href: String
    public let id: String
    public let isLocal: Bool
    public let isPlayable: Bool?
    public let name: String
    public let previewURL: String?
    public let trackNumber: Int
    public let type: String
    public let uri: String

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

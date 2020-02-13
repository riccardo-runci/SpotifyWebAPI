//
//  Album.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   public let album = try? newJSONDecoder().decode(Album.self, from: jsonData)

// MARK: - Album
public struct Album: Codable {
    public let albumType: String
    public let artists: [Artist]
    public let availableMarkets: [String]?
    public let copyrights: [Copyright]?
    public let externalIDS: ExternalIDS?
    public let externalUrls: ExternalUrls
    public let genres: [String]?
    public let href: String
    public let id: String
    public let images: [Image]
    public let label: String?
    public let name: String
    public let popularity: Int?
    public let releaseDate, releaseDatePrecision: String
    public let totalTracks: Int
    public let tracks: Tracks
    public let type, uri: String

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case copyrights
        case externalIDS = "external_ids"
        case externalUrls = "external_urls"
        case genres, href, id, images, label, name, popularity
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case tracks, type, uri
    }
}


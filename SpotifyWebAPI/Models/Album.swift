//
//  Album.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let album = try? newJSONDecoder().decode(Album.self, from: jsonData)

// MARK: - Album
public struct Album: Codable {
    let albumType: String
    let artists: [Artist]
    let availableMarkets: [String]?
    let copyrights: [Copyright]?
    let externalIDS: ExternalIDS?
    let externalUrls: ExternalUrls
    let genres: [String]?
    let href: String
    let id: String
    let images: [Image]
    let label: String?
    let name: String
    let popularity: Int?
    let releaseDate, releaseDatePrecision: String
    let totalTracks: Int
    let tracks: Tracks
    let type, uri: String

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


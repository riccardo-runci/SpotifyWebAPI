//
//  PlaylistsTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let playlistsTracks = try? newJSONDecoder().decode(PlaylistsTracks.self, from: jsonData)


// MARK: - PlaylistsTracks
public struct PlaylistsTracks: Codable {
    let href: String
    let items: [PlaylistsTracksItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

// MARK: - Item
public struct PlaylistsTracksItem: Codable {
    let addedAt: Date
    let addedBy: AddedBy
    let isLocal: Bool
    let primaryColor: String?
    let track: TracksItem
    let videoThumbnail: VideoThumbnail?

    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case addedBy = "added_by"
        case isLocal = "is_local"
        case primaryColor = "primary_color"
        case track
        case videoThumbnail = "video_thumbnail"
    }
}

// MARK: - AddedBy
public struct AddedBy: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let type: String
    let uri: String
    let name: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, type, uri, name
    }
}

// MARK: - VideoThumbnail
public struct VideoThumbnail: Codable {
    let url: String?
}

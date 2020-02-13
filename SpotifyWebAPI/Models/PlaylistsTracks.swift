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
    public let href: String
    public let items: [PlaylistsTracksItem]
    public let limit: Int
    public let next: String?
    public let offset: Int
    public let previous: String?
    public let total: Int
}

// MARK: - Item
public struct PlaylistsTracksItem: Codable {
    public let addedAt: Date
    public let addedBy: AddedBy
    public let isLocal: Bool
    public let primaryColor: String?
    public let track: TracksItem
    public let videoThumbnail: VideoThumbnail?

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
    public let externalUrls: ExternalUrls
    public let href: String
    public let id: String
    public let type: String
    public let uri: String
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, type, uri, name
    }
}

// MARK: - VideoThumbnail
public struct VideoThumbnail: Codable {
    public let url: String?
}

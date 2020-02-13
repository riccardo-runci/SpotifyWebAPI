//
//  PlaylistItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct PlaylistItem: Codable {
    public let collaborative: Bool
    public let followers: Followers?
    public let itemDescription: String
    public let externalUrls: ExternalUrls
    public let href: String
    public let id: String
    public let images: [Image]
    public let name: String
    public let owner: PlaylistOwner
    public let primaryColor, itemPublic: String?
    public let snapshotID: String
    public let tracks: Tracks
    public let type, uri: String

    enum CodingKeys: String, CodingKey {
        case followers = "followers"
        case collaborative
        case itemDescription = "description"
        case externalUrls = "external_urls"
        case href, id, images, name, owner
        case primaryColor = "primary_color"
        case itemPublic = "public"
        case snapshotID = "snapshot_id"
        case tracks, type, uri
    }
}

//
//  PlaylistItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct PlaylistItem: Codable {
    let collaborative: Bool
    let followers: Followers?
    let itemDescription: String
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let owner: PlaylistOwner
    let primaryColor, itemPublic: String?
    let snapshotID: String
    let tracks: Tracks
    let type, uri: String

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

//
//  PlaylistOwner.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Owner
public struct PlaylistOwner: Codable {
    public let displayName: String
    public let externalUrls: ExternalUrls
    public let href: String
    public let id, type, uri: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href, id, type, uri
    }
}

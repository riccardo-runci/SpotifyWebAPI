//
//  CurrentUserProfile.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 13/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let currentUserProfile = try? newJSONDecoder().decode(CurrentUserProfile.self, from: jsonData)

import Foundation

// MARK: - CurrentUserProfile
public struct CurrentUserProfile: Codable {
    public let country, displayName, email: String?
    public let explicitContent: ExplicitContent?
    public let externalUrls: ExternalUrls?
    public let followers: Followers?
    public let href: String?
    public let id: String?
    public let images: [Image]
    public let product, type, uri: String?

    enum CodingKeys: String, CodingKey {
        case country
        case displayName = "display_name"
        case email
        case explicitContent = "explicit_content"
        case externalUrls = "external_urls"
        case followers, href, id, images, product, type, uri
    }
}

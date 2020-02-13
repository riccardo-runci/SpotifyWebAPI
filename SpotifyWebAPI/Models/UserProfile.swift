//
//  UserProfile.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)


// MARK: - UserProfile
public struct UserProfile: Codable {
    public let displayName: String
    public let email, country: String?
    public let explicitContent: ExplicitContent?
    public let externalUrls: ExternalUrls
    public let followers: Followers?
    public let href: String
    public let id: String
    public let images: [Image]
    public let type, uri: String
    public let product: String?

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case explicitContent = "explicit_content"
        case followers, href, id, images, type, uri
        case product
        case email
        case country
    }
}

// MARK: - ExplicitContent
public struct ExplicitContent: Codable {
    public let filterEnabled, filterLocked: Bool?

    enum CodingKeys: String, CodingKey {
        case filterEnabled = "filter_enabled"
        case filterLocked = "filter_locked"
    }
}

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
    let displayName: String
    let email, country: String?
    let explicitContent: ExplicitContent?
    let externalUrls: ExternalUrls
    let followers: Followers?
    let href: String
    let id: String
    let images: [Image]
    let type, uri: String
    let product: String?

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
struct ExplicitContent: Codable {
    let filterEnabled, filterLocked: Bool

    enum CodingKeys: String, CodingKey {
        case filterEnabled = "filter_enabled"
        case filterLocked = "filter_locked"
    }
}

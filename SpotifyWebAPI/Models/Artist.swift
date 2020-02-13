//
//  Artist.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Artist
public struct Artist: Codable {
    public let externalUrls: ExternalUrls
    public let followers: Followers?
    public let images: [Image]?
    public let popularity: Int?
    public let genres: [String]
    public let href: String
    public let id: String
    public let name: String
    public let type: String
    public let uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case followers, genres, href, id, images, name, popularity, type, uri
    }
}

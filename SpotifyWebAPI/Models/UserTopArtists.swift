//
//  UserTopArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   public let userTopArtists = try? newJSONDecoder().decode(UserTopArtists.self, from: jsonData)

// MARK: - UserTopArtists
public struct UserTopArtists: Codable {
    public let items: [Artist]
    public let total, limit, offset: Int
    public let previous: String?
    public let href: String
    public let next: String?
}

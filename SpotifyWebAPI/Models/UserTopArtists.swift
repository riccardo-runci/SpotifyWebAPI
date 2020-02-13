//
//  UserTopArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let userTopArtists = try? newJSONDecoder().decode(UserTopArtists.self, from: jsonData)

// MARK: - UserTopArtists
public struct UserTopArtists: Codable {
    let items: [Artist]
    let total, limit, offset: Int
    let previous: String?
    let href: String
    let next: String?
}

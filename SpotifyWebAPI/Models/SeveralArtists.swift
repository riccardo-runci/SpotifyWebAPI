//
//  SeveralArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 11/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
//
// To parse the JSON, add this file to your project and do:
//
//   public let severalArtists = try? newJSONDecoder().decode(SeveralArtists.self, from: jsonData)


// MARK: - SeveralArtists
public struct SeveralArtists: Codable {
    public let artists: [Artist]
}

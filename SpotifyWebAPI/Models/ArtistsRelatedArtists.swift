//
//  ArtistsRelatedArtists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   public let artistsRelatedArtists = try? newJSONDecoder().decode(ArtistsRelatedArtists.self, from: jsonData)

// MARK: - ArtistsRelatedArtists
public struct ArtistsRelatedArtists: Codable {
    public let artists: [Artist]
}

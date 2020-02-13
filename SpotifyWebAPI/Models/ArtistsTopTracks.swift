//
//  ArtistsTopTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 11/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
//
// To parse the JSON, add this file to your project and do:
//
//   public let artistsTopTracks = try? newJSONDecoder().decode(ArtistsTopTracks.self, from: jsonData)

// MARK: - ArtistsTopTracks
public struct ArtistsTopTracks: Codable {
    public let tracks: [TracksItem]
}



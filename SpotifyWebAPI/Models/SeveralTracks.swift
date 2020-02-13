//
//  SeveralTracks.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let severalTracks = try? newJSONDecoder().decode(SeveralTracks.self, from: jsonData)

// MARK: - SeveralTracks
public struct SeveralTracks: Codable {
    let tracks: [TracksItem]
}

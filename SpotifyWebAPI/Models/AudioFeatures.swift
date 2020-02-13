//
//  AudioFeatures.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let audioFeatures = try? newJSONDecoder().decode(AudioFeatures.self, from: jsonData)

// MARK: - AudioFeatures
public struct AudioFeatures: Codable {
    public let danceability, energy: Double
    public let key: Int
    public let loudness: Double
    public let mode: Int
    public let speechiness, acousticness, instrumentalness, liveness: Double
    public let valence, tempo: Double
    public let type, id, uri: String
    public let trackHref, analysisURL: String
    public let durationMS, timeSignature: Int

    enum CodingKeys: String, CodingKey {
        case danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, type, id, uri
        case trackHref = "track_href"
        case analysisURL = "analysis_url"
        case durationMS = "duration_ms"
        case timeSignature = "time_signature"
    }
}


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
    let danceability, energy: Double
    let key: Int
    let loudness: Double
    let mode: Int
    let speechiness, acousticness, instrumentalness, liveness: Double
    let valence, tempo: Double
    let type, id, uri: String
    let trackHref, analysisURL: String
    let durationMS, timeSignature: Int

    enum CodingKeys: String, CodingKey {
        case danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, type, id, uri
        case trackHref = "track_href"
        case analysisURL = "analysis_url"
        case durationMS = "duration_ms"
        case timeSignature = "time_signature"
    }
}


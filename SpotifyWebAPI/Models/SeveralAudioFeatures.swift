//
//  SeveralAudioFeatures.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let severalAudioFeatures = try? newJSONDecoder().decode(SeveralAudioFeatures.self, from: jsonData)

// MARK: - SeveralAudioFeatures
public struct SeveralAudioFeatures: Codable {
    let audioFeatures: [AudioFeatures]

    enum CodingKeys: String, CodingKey {
        case audioFeatures = "audio_features"
    }
}

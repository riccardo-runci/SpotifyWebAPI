//
//  UserPlayback.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let currentUserPlayback = try? newJSONDecoder().decode(CurrentUserPlayback.self, from: jsonData)


// MARK: - CurrentUserPlayback
public struct CurrentUserPlayback: Codable {
    let device: Device
    let shuffleState: Bool
    let repeatState: String
    let timestamp: Int
    let context: Context
    let progressMS: Int
    let item: TracksItem
    let currentlyPlayingType: String
    let actions: Actions
    let isPlaying: Bool

    enum CodingKeys: String, CodingKey {
        case device
        case shuffleState = "shuffle_state"
        case repeatState = "repeat_state"
        case timestamp, context
        case progressMS = "progress_ms"
        case item
        case currentlyPlayingType = "currently_playing_type"
        case actions
        case isPlaying = "is_playing"
    }
}

// MARK: - Actions
public struct Actions: Codable {
    let disallows: Disallows
}

// MARK: - Disallows
public struct Disallows: Codable {
    let pausing, skippingPrev: Bool

    enum CodingKeys: String, CodingKey {
        case pausing
        case skippingPrev = "skipping_prev"
    }
}

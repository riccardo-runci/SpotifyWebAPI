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
    public let device: Device
    public let shuffleState: Bool
    public let repeatState: String
    public let timestamp: Int
    public let context: Context
    public let progressMS: Int
    public let item: TracksItem
    public let currentlyPlayingType: String
    public let actions: Actions
    public let isPlaying: Bool

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
    public let disallows: Disallows
}

// MARK: - Disallows
public struct Disallows: Codable {
    public let pausing, skippingPrev: Bool

    enum CodingKeys: String, CodingKey {
        case pausing
        case skippingPrev = "skipping_prev"
    }
}

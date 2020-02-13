//
//  CurrentUserPlayingTrack.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let currentUserPlayingTrack = try? newJSONDecoder().decode(CurrentUserPlayingTrack.self, from: jsonData)


// MARK: - CurrentUserPlayingTrack
public struct CurrentUserPlayingTrack: Codable {
    let timestamp: Int
    let context: Context
    let progressMS: Int
    let item: TracksItem
    let currentlyPlayingType: String
    let actions: Actions
    let isPlaying: Bool

    enum CodingKeys: String, CodingKey {
        case timestamp, context
        case progressMS = "progress_ms"
        case item
        case currentlyPlayingType = "currently_playing_type"
        case actions
        case isPlaying = "is_playing"
    }
}

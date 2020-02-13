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
    public let timestamp: Int
    public let context: Context
    public let progressMS: Int
    public let item: TracksItem
    public let currentlyPlayingType: String
    public let actions: Actions
    public let isPlaying: Bool

    enum CodingKeys: String, CodingKey {
        case timestamp, context
        case progressMS = "progress_ms"
        case item
        case currentlyPlayingType = "currently_playing_type"
        case actions
        case isPlaying = "is_playing"
    }
}

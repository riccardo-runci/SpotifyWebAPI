//
//  RecommendationsBasedOnSeeds.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let raommendationsBasedOnSeeds = try? newJSONDecoder().decode(RaommendationsBasedOnSeeds.self, from: jsonData)


// MARK: - RaommendationsBasedOnSeeds
public struct RecommendationsBasedOnSeeds: Codable {
    let tracks: [TracksItem]
    let seeds: [Seed]
}

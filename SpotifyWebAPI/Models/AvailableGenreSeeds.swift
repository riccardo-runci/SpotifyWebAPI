//
//  AvailableGenreSeeds.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let availableGenreSeeds = try? newJSONDecoder().decode(AvailableGenreSeeds.self, from: jsonData)

// MARK: - AvailableGenreSeeds
public struct AvailableGenreSeeds: Codable {
    let genres: [String]
}


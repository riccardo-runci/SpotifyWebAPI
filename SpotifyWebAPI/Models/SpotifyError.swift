//
//  SpotifyError.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 09/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
// let spotifyError = try? newJSONDecoder().decode(SpotifyError.self, from: jsonData)

import Foundation

// MARK: - SpotifyError
public struct SpotifyError: Codable {
    let error: Error
}

// MARK: - Error
public struct Error: Codable {
    let status: Int
    let message: String
}

//
//  SpotifyError.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 09/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
// public let spotifyError = try? newJSONDecoder().decode(SpotifyError.self, from: jsonData)

import Foundation

// MARK: - SpotifyError
public struct SpotifyError: Codable {
    public let error: Error
}

// MARK: - Error
public struct Error: Codable {
    public let status: Int
    public let message: String
}

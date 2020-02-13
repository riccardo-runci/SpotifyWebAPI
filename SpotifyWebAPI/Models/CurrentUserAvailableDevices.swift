//
//  CurrentUserAvailableDevices.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let currentUserDevices = try? newJSONDecoder().decode(CurrentUserAvailableDevices.self, from: jsonData)

// MARK: - CurrentUserAvailableDevices
public struct CurrentUserAvailableDevices: Codable {
    public let devices: [Device]
}

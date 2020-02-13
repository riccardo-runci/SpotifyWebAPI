//
//  CurrentUserAvailableDevices.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentUserDevices = try? newJSONDecoder().decode(CurrentUserAvailableDevices.self, from: jsonData)

import Foundation

// MARK: - CurrentUserAvailableDevices
public struct CurrentUserAvailableDevices: Codable {
    let devices: [Device]
}

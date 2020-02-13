//
//  NewReleaseList.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let newReleasesList = try? newJSONDecoder().decode(NewReleasesList.self, from: jsonData)

import Foundation

// MARK: - NewReleasesList
public struct NewReleasesList: Codable {
    let albums: Albums
}

//
//  BrowseCategorieSingle.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let browseCategorieSingle = try? newJSONDecoder().decode(BrowseCategorieSingle.self, from: jsonData)

// MARK: - BrowseCategorieSingle
public struct BrowseCategorieSingle: Codable {
    let href: String
    let icons: [Icon]
    let id, name: String
}

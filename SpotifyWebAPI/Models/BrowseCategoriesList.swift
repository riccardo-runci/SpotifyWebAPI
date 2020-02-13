//
//  BrowseCategoriesList.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let browseCategoriesList = try? newJSONDecoder().decode(BrowseCategoriesList.self, from: jsonData)

// MARK: - BrowseCategoriesList
public struct BrowseCategoriesList: Codable {
    let categories: Categories
}


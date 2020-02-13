//
//  CategoriesItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct CategoriesItem: Codable {
    let href: String
    let icons: [Icon]
    let id, name: String
}

//
//  CategoriesItem.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Item
public struct CategoriesItem: Codable {
    public let href: String
    public let icons: [Icon]
    public let id, name: String
}

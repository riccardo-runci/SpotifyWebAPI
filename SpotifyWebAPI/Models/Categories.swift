//
//  Categories.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Categories
public struct Categories: Codable {
    public let href: String
    public let items: [CategoriesItem]
    public let limit: Int
    public let next: String
    public let offset: Int
    public let previous: String?
    public let total: Int
}

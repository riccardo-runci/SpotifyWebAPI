//
//  Seed.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Seed
public struct Seed: Codable {
    public let initialPoolSize, afterFilteringSize, afterRelinkingSize: Int
    public let id, type: String
    public let href: String?
}

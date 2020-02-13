//
//  Seed.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Seed
public struct Seed: Codable {
    let initialPoolSize, afterFilteringSize, afterRelinkingSize: Int
    let id, type: String
    let href: String?
}

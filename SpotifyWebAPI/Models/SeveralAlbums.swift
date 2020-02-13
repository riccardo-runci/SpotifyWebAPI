//
//  SeveralAlbums.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   public let severalAlbums = try? newJSONDecoder().decode(SeveralAlbums.self, from: jsonData)

// MARK: - SeveralAlbums
public struct SeveralAlbums: Codable {
    public let albums: [Album]
    
    enum CodingKeys: String, CodingKey {
        case albums = "albums"
    }
}

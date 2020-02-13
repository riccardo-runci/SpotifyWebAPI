//
//  Image.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 10/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Image
public struct Image: Codable {
    public let height: Int?
    public let url: String
    public let width: Int?
}

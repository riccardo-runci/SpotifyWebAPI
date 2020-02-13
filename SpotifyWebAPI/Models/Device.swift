//
//  Device.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// MARK: - Device
public struct Device: Codable {
    public let id: String
    public let isActive, isPrivateSession, isRestricted: Bool
    public let name, type: String
    public let volumePercent: Int

    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "is_active"
        case isPrivateSession = "is_private_session"
        case isRestricted = "is_restricted"
        case name, type
        case volumePercent = "volume_percent"
    }
}

//
//  AuthorizationServiceConfiguration.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 13/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation

public class AuthorizationServiceConfiguration: Codable {
    public let clientId: String
    public let clientSecret: String
    public let redirectUri: String
    public let scopes: [String]
    
    public init(clientId: String, clientSecret: String, redirectUri: String, scopes: [String]) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scopes = scopes
    }

    public var encodedScopes: String {
      return scopes.joined(separator: "%20")
    }
}

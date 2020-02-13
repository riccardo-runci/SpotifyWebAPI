//
//  AuthorizationServiceConfiguration.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 13/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation

public class AuthorizationServiceConfiguration {
    public let clientId: String
    public let clientSecret: String
    public let redirectUri: String
    public let scopes: [Scopes]
    
    public init(clientId: String, clientSecret: String, redirectUri: String, scopes: [Scopes]) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scopes = scopes
    }

    public var encodedScopes: String {
        return scopes.map { $0.rawValue }.joined(separator: "%20")
    }
}

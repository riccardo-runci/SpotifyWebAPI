//
//  SpotifyAPI.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 09/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public enum SearchFilterType: String {
    case album = "album"
    case artist = "artist"
    case playlist = "playlist"
    case track = "track"
}

public enum FollowFilterType: String{
    case artist = "artist"
    case user = "user"
}

public class Variables{
    public var userToken: String {
        get{
            return UserDefaults.standard.string(forKey: "ACCESS_TOKEN_KEY") ?? ""
        }
    }
}

// MARK: TODO Remove from Playlists, Search for Item


public class SpotifyAPI {
    
    public static let v1 = SpotifyAPI()
    
    public var albums: AlbumsServices!
    public var artists: ArtistsServices!
    public var browse: BrowseServices!
    public var follow: FollowServices!
    public var library: LibraryServices!
    public var personalization: PersonalizationServices!
    public var player: PlayerServices!
    public var playlists: PlaylistsServices!
    public var search: SearchServices!
    public var tracks: TracksServices!
    public var userProfile: UserProfileServices!
    public var auth: AuthorizationServices!
    
    public let variables = Variables()
    
    private let baseUrl = "https://api.spotify.com/v1"
    
    init() {
        self.albums = AlbumsServices(self.variables, self.baseUrl)
        self.artists = ArtistsServices(self.variables, self.baseUrl)
        self.browse = BrowseServices(self.variables, self.baseUrl)
        self.follow = FollowServices(self.variables, self.baseUrl)
        self.library = LibraryServices(self.variables, self.baseUrl)
        self.personalization = PersonalizationServices(self.variables, self.baseUrl)
        self.player = PlayerServices(self.variables, self.baseUrl)
        self.playlists = PlaylistsServices(self.variables, self.baseUrl)
        self.search = SearchServices(self.variables, self.baseUrl)
        self.tracks = TracksServices(self.variables, self.baseUrl)
        self.userProfile = UserProfileServices(self.variables, self.baseUrl)
        self.auth = AuthorizationServices()
    }
}

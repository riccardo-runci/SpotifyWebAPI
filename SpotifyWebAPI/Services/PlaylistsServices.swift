//
//  PlaylistsServices.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class PlaylistsServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/users/{{user_id}}/playlists
    //Get User's Playlist list
    public func getUsersPlaylistList(userId: String, limit: Int?, offSet: Int?, onComplete : @escaping (_ response : UsersPlaylistsList?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/users/" + userId + "/playlists")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "offset" : offSet ?? 0]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            let result = try? decoder.decode(UsersPlaylistsList.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/users/{{user_id}}/playlists
    //Get User's Playlist list
    public func getCurrentUsersPlaylistList(limit: Int?, offSet: Int?, onComplete : @escaping (_ response : UsersPlaylistsList?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/playlists")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "offset" : offSet ?? 0]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            let result = try? decoder.decode(UsersPlaylistsList.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    public func getPlaylist(id: String, onComplete : @escaping (_ response : PlaylistItem?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/playlists/" + id)!
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get,  encoding: JSONEncoding.default, headers: headers).responseData { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            let result = try? decoder.decode(PlaylistItem.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getPlaylistCoverImage(id: String, onComplete : @escaping (_ response : [Image]?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/playlists/" + id + "/images")!
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get,  encoding: JSONEncoding.default, headers: headers).responseData { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            let result = try? decoder.decode([Image].self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/playlists/{{playlist_id}}/tracks?limit=10&offset=0
    public func getPlaylistsTracks(id: String, limit: Int?, offSet: Int?, onComplete : @escaping (_ response : PlaylistsTracks?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/playlists/" + id + "/tracks")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "offset" : offSet ?? 0]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            let result = try? decoder.decode(PlaylistsTracks.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    public func createPlaylist(userId: String, name: String, description: String, isPublic: Bool, onComplete : @escaping (_ response : PlaylistItem?, SpotifyError?) -> ()){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/users/" + userId + "/playlists")!
        
        let parameters : Parameters = ["name" : name, "description" : description, "public" : isPublic]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            let result = try? decoder.decode(PlaylistItem.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    

    //https://api.spotify.com/v1/playlists/{{playlist_id}}/tracks?uris=spotify%3Atrack%3A4iV5W9uYEdYUVa79Axb7Rh%2Cspotify%3Atrack%3A1301WleyT98MSxVHPZCA6M
    public func addTracksToPlaylists(playlistId: String, uris: [String], onComplete : @escaping (_ response : String?, SpotifyError?) -> ()){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]
        
        var str = ""
        for element in uris{
            str += (element + "%2C")
        }
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        
        let url = URL(string: baseUrl + "/playlists/" + playlistId + "/tracks?uris=" + str)!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .post, encoding: JSONEncoding.default, headers: headers).responseData { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()
            
            let result = try? decoder.decode(String.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }

    
    
    public func reorderOrReplacePlaylistsTracks(id: String, rangeStart: Int, rangeLength: Int, insertBefore: Int, onComplete : @escaping (_ response : String?, SpotifyError?) -> ()){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/playlists/" + id + "/tracks")!
        
        let parameters : Parameters = ["range_start" : rangeStart, "range_length" : rangeLength, "insert_before" : insertBefore]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            let result = try? decoder.decode(String.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    public func editPlaylistDetails(id: String, name: String, description: String, isPublic: Bool, onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
                let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/playlists/" + id)!
        
        let parameters : Parameters = ["name" : name, "description" : description, "public" : isPublic]

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
            }
            guard
                let data = response.data else {
                    onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()
            
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(response.response?.statusCode, spotifyError)
        }
    }
}

//
//  Follo.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class FollowServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/me/following
    public func getFollowedArtists(limit: Int?, onComplete : @escaping (_ response : FollowedArtists?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/following")!
        
        let parameters: Parameters = ["type" : "artist", "limit" : limit ?? 20]
        
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

            let result = try? decoder.decode(FollowedArtists.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/me/following/contains
    //Check if Current User Follows Artists or Users
    public func checkIfUserFollowsArtistsOrUsers(ids: [String], type: FollowFilterType, onComplete : @escaping (_ response : [Bool]?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]
        
        var str = ""
        for element in ids{
            str += (element + "%2C")
        }
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        
        let url = URL(string: baseUrl + "/me/following/contains?type=" + type.rawValue + "&ids=" + str)!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
            let result = try? decoder.decode([Bool].self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/me/following?type=artist&ids=2CIMQHirSU0MQqyYHq0eOx%2C57dN52uHvrHOxijzpIgu3E%2C1vCWHaC5f2uS3yhpwWbIA6
    //Check if Current User Follows Artists or Users
    public func followArtistsOrUsers(ids: [String], type: FollowFilterType, onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]
        
        var str = ""
        for element in ids{
            str += (element + "%2C")
        }
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        
        let url = URL(string: baseUrl + "/me/following?type=" + type.rawValue + "&ids=" + str)!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .put, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
    public func unfollowArtistsOrUsers(ids: [String], type: FollowFilterType, onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]
        
        var str = ""
        for element in ids{
            str += (element + "%2C")
        }
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        
        let url = URL(string: baseUrl + "/me/following?type=" + type.rawValue + "&ids=" + str)!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .delete, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
    // Check if Users Follow a Playlist
    //https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n/followers/contains?ids=jmperezperez%2Cthelinmichael%2Cwizzler
    public func checkIfUsersFollowPlaylist(playlistId: String, usersIds: [String], onComplete : @escaping (_ response : [Bool]?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]
        
        var str = ""
        for element in usersIds{
            str += (element + "%2C")
        }
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        str.remove(at: str.index(before: str.endIndex))
        
        let url = URL(string: baseUrl + "/playlists/" + playlistId + "/followers/contains?ids=" + str)!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
            let result = try? decoder.decode([Bool].self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n/followers
    public func followAPlaylist(id: String, onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        let url = URL(string: baseUrl + "/playlists/" + id + "/followers")!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .put, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
    public func unfollowAPlaylist(id: String, onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        let url = URL(string: baseUrl + "/playlists/" + id + "/followers")!
        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .delete, encoding: JSONEncoding.default, headers: headers).responseData { response in
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

//
//  Library.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class LibraryServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/me/tracks
    public func getCurrentUserSavedTracks(limit: Int?, offSet: Int?, onComplete : @escaping (_ response : UserSavedTracks?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/tracks")!
        
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

            let result = try? decoder.decode(UserSavedTracks.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/me/tracks/contains?ids={{multitrack_ids}}
    //Check Current User's Saved Tracks
    public func checkCurrentUsersSavedTracks(ids: [String], onComplete : @escaping (_ response : [Bool]?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/tracks/contains?ids=" + str)!
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
    
    public func saveTracksForCurrentUser(ids: [String], onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/tracks?ids=" + str)!
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
    
    public func removeTracksForCurrentUser(ids: [String], onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/tracks?ids=" + str)!
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
    
    //https://api.spotify.com/v1/me/albums
    public func getCurrentUserSavedAlbums(limit: Int?, offSet: Int?, onComplete : @escaping (_ response : UserSavedAlbums?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/albums")!
        
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

            let result = try? decoder.decode(UserSavedAlbums.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //Check Current User's Saved Albums
    public func checkCurrentUsersSavedAlbums(ids: [String], onComplete : @escaping (_ response : [Bool]?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/albums/contains?ids=" + str)!
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
    
    public func saveAlbumsForCurrentUser(ids: [String], onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/albums?ids=" + str)!
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
    
    public func removeAlbumsForCurrentUser(ids: [String], onComplete : @escaping (_ response : Int?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/me/albums?ids=" + str)!
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

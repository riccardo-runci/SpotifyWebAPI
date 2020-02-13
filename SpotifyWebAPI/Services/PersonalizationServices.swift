//
//  Personalization.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class PersonalizationServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/me/top/artists?limit=10&offset=5
    //Get User's Top Artists and Tracks
    public func getUsersTopArtist(limit: Int?, offset: Int?, onComplete : @escaping (_ response : UserTopArtists?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/top/artists")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "offset" : offset ?? 0]

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

            let result = try? decoder.decode(UserTopArtists.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/me/top/artists?limit=10&offset=5
    //Get User's Top Artists and Tracks
    public func getUsersTopTracks(limit: Int?, offset: Int?, onComplete : @escaping (_ response : UserTopTracks?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/me/top/tracks")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "offset" : offset ?? 0]

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

            let result = try? decoder.decode(UserTopTracks.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
}

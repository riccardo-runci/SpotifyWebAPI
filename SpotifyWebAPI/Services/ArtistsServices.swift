//
//  Artists.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class ArtistsServices{

    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }

    public func getArtist(id: String, onComplete : @escaping (_ response : Artist?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/artists/" + id)!

        print("REQUEST: \(#function)")
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
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

            let result = try? decoder.decode(Artist.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }

    public func getSeveralArtists(ids: [String], onComplete : @escaping (_ response : SeveralArtists?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/artists?ids=" + str)!
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
            let result = try? decoder.decode(SeveralArtists.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/albums?limit=10&offset=5
    public func getArtistsAlbum(id: String, limit: Int?, offset: Int?, onComplete : @escaping (_ response : AlbumsTracks?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]

        let urlString = baseUrl + "/artists/" + id + "/albums"

        
        let url = URL(string: urlString)!
        
        let parameters: Parameters = ["limit" : limit ?? 25, "offset" : offset ?? 0]

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

            let result = try? decoder.decode(AlbumsTracks.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    public func getArtistsTopTracks(id: String, country: String, onComplete : @escaping (_ response : ArtistsTopTracks?, SpotifyError?) -> ()){
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]

        let urlString = baseUrl + "/artists/" + id + "/top-tracks"

        
        let url = URL(string: urlString)!
        
        let parameters: Parameters = ["country" : country]

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

            let result = try? decoder.decode(ArtistsTopTracks.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/artists/43ZHCT0cAZBISjO8DG9PnE/related-artists
    public func getArtistsRelatedArtists(id: String, onComplete : @escaping (_ response : ArtistsRelatedArtists?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        let url = URL(string: baseUrl + "/artists/" + id + "/related-artists")!
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
            let result = try? decoder.decode(ArtistsRelatedArtists.self, from: data)
            onComplete(result, spotifyError)
        }
    }
}

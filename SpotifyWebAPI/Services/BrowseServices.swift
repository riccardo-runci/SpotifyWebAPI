//
//  Browse.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class BrowseServices{

    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/artists/0TnOYISbd1XYRBk9myaseg/albums?limit=10&offset=5
    public func getNewReleasesList(country: String?, limit: Int?, offset: Int?, onComplete : @escaping (_ response : NewReleasesList?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/browse/new-releases")!
        
        var parameters: Parameters = ["limit" : limit ?? 20, "offset" : offset ?? 0]
        if let c = country {
            parameters.updateValue(c, forKey: "country")
        }
        
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

            let result = try? decoder.decode(NewReleasesList.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/browse/featured-playlists
    //Get a List of Featured Playlists
    public func getFeaturedPlaylistsList(limit: Int?, offset: Int?, onComplete : @escaping (_ response : FeaturedPlaylistsList?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/browse/featured-playlists")!
        
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

            let result = try? decoder.decode(FeaturedPlaylistsList.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/browse/categories
    //Get a List of Browse Categories
    public func getBrowseCategoriesList(limit: Int?, offset: Int?, onComplete : @escaping (_ response : BrowseCategoriesList?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/browse/categories")!
        
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

            let result = try? decoder.decode(BrowseCategoriesList.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/browse/categories/{category_id}
    public func getBrowseCategorieSingle(id: String, onComplete : @escaping (_ response : BrowseCategorieSingle?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        let url = URL(string: baseUrl + "/browse/categories/" + id)!
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
            let result = try? decoder.decode(BrowseCategorieSingle.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/browse/categories/{category_id}/playlists
    public func getCategorysPlaylists(id: String, limit: Int?, offset: Int?, onComplete : @escaping (_ response : CategorysPlaylists?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/browse/categories/" + id + "/playlists")!
        
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

            let result = try? decoder.decode(CategorysPlaylists.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/recommendations
    public func getRecommendationsBasedOnSeeds(artistSeed: String, seedGenre: String, seedTrack: String, limit: Int?, onComplete : @escaping (_ response : RecommendationsBasedOnSeeds?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]
        
        let url = URL(string: baseUrl + "/recommendations")!
        
        let parameters: Parameters = ["limit" : limit ?? 20, "seed_artists" : artistSeed, "seed_genres" : seedGenre, "seed_tracks" : seedTrack]
        
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

            let result = try? decoder.decode(RecommendationsBasedOnSeeds.self, from: data)
            let spotifyError = try? decoder.decode(SpotifyError.self, from: data)
            
            onComplete(result, spotifyError)
        }
    }
    
    //https://api.spotify.com/v1/recommendations/available-genre-seeds
    //Get Available Genre Seeds
    public func getAvailableGenreSeeds(onComplete : @escaping (_ response : AvailableGenreSeeds?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken,
        ]

        let url = URL(string: baseUrl + "/recommendations/available-genre-seeds")!
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
            let result = try? decoder.decode(AvailableGenreSeeds.self, from: data)
            onComplete(result, spotifyError)
        }
    }
}

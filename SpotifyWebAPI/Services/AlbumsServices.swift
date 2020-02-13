//
//  Albums.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class AlbumsServices{

    private var variables: Variables!
    private var baseUrl: String!
    
    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    public func getAlbum(id: String, onComplete : @escaping (_ response : Album?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/albums/" + id)!
        
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
            let result = try? decoder.decode(Album.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getSeveralAlbums(ids: [String], onComplete : @escaping (_ response : SeveralAlbums?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/albums?ids=" + str)!
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
            let result = try? decoder.decode(SeveralAlbums.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    
    //https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy/tracks?limit=10&offset=5"
    public func getAlbumsTracks(id: String, limit: Int?, offset: Int?, onComplete : @escaping (_ response : AlbumsTracks?, SpotifyError?) -> ()){
        
        let headers : HTTPHeaders = [
            "Authorization": "Bearer " + self.variables.userToken
        ]

        let urlString = baseUrl + "/albums/" + id + "/tracks"

        
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
}

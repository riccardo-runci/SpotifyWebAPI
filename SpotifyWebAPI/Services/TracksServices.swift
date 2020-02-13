//
//  TracksServices.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class TracksServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    //https://api.spotify.com/v1/tracks/{id}
    public func getTrack(id: String, onComplete : @escaping (_ response : TracksItem?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/tracks/" + id)!
        
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
            let result = try? decoder.decode(TracksItem.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getSeveralTracks(ids: [String], onComplete : @escaping (_ response : SeveralTracks?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/tracks?ids=" + str)!
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
            let result = try? decoder.decode(SeveralTracks.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getAudioFeaturesForTrack(id: String, onComplete : @escaping (_ response : AudioFeatures?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/audio-features/" + id)!
        
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
            let result = try? decoder.decode(AudioFeatures.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getSeveralAudioFeaturesForTracks(ids: [String], onComplete : @escaping (_ response : SeveralAudioFeatures?, SpotifyError?) -> ()){
        
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
        
        let url = URL(string: baseUrl + "/audio-features?ids=" + str)!
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
            let result = try? decoder.decode(SeveralAudioFeatures.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getAudioAnalysisForTrack(id: String, onComplete : @escaping (_ response : AudioAnalysis?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/audio-analysis/" + id)!
        
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
            let result = try? decoder.decode(AudioAnalysis.self, from: data)
            onComplete(result, spotifyError)
        }
    }
}

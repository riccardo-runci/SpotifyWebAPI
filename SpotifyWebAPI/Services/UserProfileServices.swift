//
//  UserProfileServices.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import Alamofire

public class UserProfileServices{
    private var variables: Variables!
    private var baseUrl: String!

    init(_ variables: Variables,_ baseUrl: String) {
        self.variables = variables
        self.baseUrl = baseUrl
    }
    
    public func getUserProfile(id: String, onComplete : @escaping (_ response : UserProfile?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/users/" + id)!
        
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
            let result = try? decoder.decode(UserProfile.self, from: data)
            onComplete(result, spotifyError)
        }
    }
    
    public func getCurrentUserProfile(onComplete : @escaping (_ response : UserProfile?, SpotifyError?) -> ()){
        let url = URL(string: baseUrl + "/me")!
        
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
            let result = try? decoder.decode(UserProfile.self, from: data)
            onComplete(result, spotifyError)
        }
    }
}

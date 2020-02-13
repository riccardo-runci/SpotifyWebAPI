//
//  AuthorizationService.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

import Foundation
import SafariServices
//import AuthenticationServices
import Alamofire

public enum Scopes : String{
    case app_remote_control = "app-remote-control"
    case streaming = "streaming"
    case ugc_image_upload = "ugc-image-upload"
    case user_read_private = "user-read-private"
    case user_read_email = "user-read-email"
    case playlist_read_private = "playlist-read-private"
    case user_library_read = "user-library-read"
    case user_library_modify = "user-library-modify"
    case user_top_read = "user-top-read"
    case playlist_read_collaborative = "playlist-read-collaborative"
    case playlist_modify_public = "playlist-modify-public"
    case playlist_modify_private = "playlist-modify-private"
    case user_follow_read = "user-follow-read"
    case user_follow_modify = "user-follow-modify"
    case user_read_playback_state = "user-read-playback-state"
    case user_read_currently_playing = "user-read-currently-playing"
    case user_modify_playback_state = "user-modify-playback-state"
    case user_read_recently_played = "user-read-recently-played"
}

public class AuthorizationServices {
    
    public var configuration: AuthorizationServiceConfiguration?

    
    private var AUTHORIZATION_CODE: String? {
      return UserDefaults.standard.string(forKey: AUTHORIZATION_CODE_KEY)
    }
    private var ACCESS_TOKEN: String? {
      return UserDefaults.standard.string(forKey: ACCESS_TOKEN_KEY)
    }
    private var EXPIRES_IN: String? {
      return UserDefaults.standard.string(forKey: EXPIRES_IN_KEY)
    }
    private var REFRESH_TOKEN: String? {
      return UserDefaults.standard.string(forKey: REFRESH_TOKEN_KEY)
    }
    private var TOKEN_TYPE: String? {
      return UserDefaults.standard.string(forKey: TOKEN_TYPE_KEY)
    }
    
    private let AUTHORIZATION_CODE_KEY = "AUTHORIZATION_CODE_KEY"
    private let ACCESS_TOKEN_KEY = "ACCESS_TOKEN_KEY"
    private let EXPIRES_IN_KEY = "EXPIRES_IN_KEY"
    private let REFRESH_TOKEN_KEY = "REFRESH_TOKEN_KEY"
    private let TOKEN_TYPE_KEY = "TOKEN_TYPE_KEY"
    
    private let tokenUrl = "https://accounts.spotify.com/api/token"
    private var authSession: SFAuthenticationSession?
   
    public func clearCookies(){
        UserDefaults.standard.removeObject(forKey: AUTHORIZATION_CODE_KEY)
        UserDefaults.standard.removeObject(forKey: ACCESS_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: EXPIRES_IN_KEY)
        UserDefaults.standard.removeObject(forKey: REFRESH_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: TOKEN_TYPE_KEY)
    }
    
    public func getAccessToken() -> AccessToken {
        return AccessToken(accessToken: ACCESS_TOKEN, expiresIn: Int(EXPIRES_IN ?? "0"), refreshToken: REFRESH_TOKEN, tokenType: TOKEN_TYPE)
    }
    
    public func updateAccessToken(accessToken: AccessToken){
        self.saveAccessToken(refreshTokenResponse: accessToken)
    }

    public func checkIfSessionIsExpired(onComplete : @escaping (_ expired : Bool) -> ()){
        if(ACCESS_TOKEN == nil || ACCESS_TOKEN == ""){
            onComplete(true)
            return
        }
        SpotifyAPI.v1.userProfile.getCurrentUserProfile { (result, error) in
            guard let err = error?.error else{
                onComplete(false)
                return
            }
            if(err.status == 200){
                onComplete(false)
            }
            else{
                onComplete(true)
            }
            
        }
    }
    
    public func authenticate (onComplete : @escaping (_ response : AccessToken?, SpotifyError?) -> ()) {
        
        guard let config = configuration else{
            print("NO CONFIGURATION SET")
            onComplete(nil, nil)
            return
        }

        let urlString = "https://accounts.spotify.com/authorize?client_id=\(config.clientId)&response_type=code&show_dialog=true&redirect_uri=\(config.redirectUri)&scope=\(config.encodedScopes)"

        let authURL = URL(string: urlString)!
        let callbackUrlScheme = config.redirectUri

        //Initialize auth session
        self.authSession = SFAuthenticationSession(url: authURL, callbackURLScheme: callbackUrlScheme, completionHandler: { (callBack, error) in
                        // handle auth response
            guard error == nil, let successURL = callBack else {
                print(error?.localizedDescription ?? "")
                onComplete(nil, SpotifyError(error: Error(status: 0, message: error?.localizedDescription ?? "Internal Error")))
                return
            }

            let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first

            if let code = oauthToken?.value{
                self.requestToken(code: code, onComplete: onComplete)
            }
            else{
                onComplete(nil, SpotifyError(error: Error(status: 0, message: "No OAuth Token")))
            }
        })

        self.authSession?.start()
    }
    
    public func requestToken (code: String, onComplete : @escaping (_ response : AccessToken?, SpotifyError?) -> ()) {
        guard let config = configuration else{
            print("NO CONFIGURATION SET")
            onComplete(nil, nil)
            return
        }
        
        saveAuthorizationCode(code: code)

        let parameters: Parameters = [
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": config.redirectUri,
            "client_id": config.clientId,
            "client_secret": config.clientSecret
        ]

        print("REQUEST: \(#function)")
        Alamofire.request(tokenUrl, method: .post, parameters: parameters).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
                onComplete(nil, nil)
                return
            }
            guard
                let data = response.data else {
                 onComplete(nil, SpotifyError(error: Error(status: 0, message: "No Response Data")))
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()

            do {
                let result = try decoder.decode(AccessToken.self, from: data)
                self.saveAccessToken(refreshTokenResponse: result)
                onComplete(result, nil)
            }
            catch{
                print(error.localizedDescription)
                onComplete(nil, SpotifyError(error: Error(status: 0, message: error.localizedDescription)))
            }
          
        }
    }
    
    public func refreshToken (onComplete : @escaping (_ response : AccessToken?, SpotifyError?) -> ()) {
        guard let config = configuration else{
            print("NO CONFIGURATION SET")
            onComplete(nil, nil)
            return
        }
        
        if(REFRESH_TOKEN == nil || REFRESH_TOKEN == ""){
            onComplete(nil, SpotifyError(error: Error(status: 0, message: "Invalid refresh token, you must authenticate first. Try authenticate()")))
            return
        }

        let parameters: Parameters = [
            "grant_type": "refresh_token",
            "refresh_token": REFRESH_TOKEN ?? "",
            "client_id": config.clientId,
            "client_secret": config.clientSecret
        ]
        
        print("REQUEST: \(#function)")
        Alamofire.request(tokenUrl, method: .post, parameters: parameters).responseJSON { response in
            print("RESPONSE: \(#function) - " + (response.response?.statusCode.description ?? ""))
            if let error = response.error {
                print(error)
                onComplete(nil, SpotifyError(error: Error(status: 0, message: "No Response Data")))
                return
            }
            guard
                let data = response.data else {
                 onComplete(nil, nil)
                    return
            }
            let decoder: JSONDecoder = JSONDecoder.init()
            do {
                let result = try decoder.decode(AccessToken.self, from: data)
                self.saveAccessToken(refreshTokenResponse: result)
                onComplete(result, nil)
            }
            catch{
                print(error.localizedDescription)
                onComplete(nil, SpotifyError(error: Error(status: 0, message: error.localizedDescription)))
            }
        }
    }
    
    private func saveAuthorizationCode (code: String) {
      UserDefaults.standard.set(code, forKey: AUTHORIZATION_CODE_KEY)
      UserDefaults.standard.synchronize()
    }
    
    private func saveAccessToken (refreshTokenResponse: AccessToken?) {
        let defaults = UserDefaults.standard
        guard let refreshTokenResponse = refreshTokenResponse else {
            return
        }
        if let accessToken = refreshTokenResponse.accessToken {
            defaults.set(accessToken, forKey: ACCESS_TOKEN_KEY)
        }
        if let expiresIn = refreshTokenResponse.expiresIn {
            defaults.set(expiresIn, forKey: EXPIRES_IN_KEY)
        }
        if let refreshToken = refreshTokenResponse.refreshToken {
            defaults.set(refreshToken, forKey: REFRESH_TOKEN_KEY)
        }
        if let tokenType = refreshTokenResponse.tokenType {
            defaults.set(tokenType, forKey: TOKEN_TYPE_KEY)
        }
        defaults.synchronize()
    }
}

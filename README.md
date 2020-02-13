# SpotifyWebAPI
Spotify web Api for iOS, include authentication services and the WebServices available from Spotify

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development or testing purposes.

## Requirements

- iOS 11.0+
- xCode 9+
- Swift 5
- App successfully set from the Spotify Developers dashboard

## Installing

### CocoaPods

To integrate SpotifyWebAPI into your xCode project using CocoaPods, specify it in your ``` Podfile``` :

``` 
pod 'SpotifyWebAPI', :git => 'https://github.com/Rilissimo1/SpotifyWebAPI' 
```

Then, run the following command:

```$ pod install```

This will download any library dependencies you do not already have in your project.

## Usage

#### Edit your info.plist

Add (or edit) these following lines of your Info.plist file
```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>{YOUR REDIRECT URI PREFIX}</string>
    </array>
  </dict>
</array>
```

Replace the redirect uri prefix with your own

#### Authorization Process

Import the library

```swift
import SpotifyWebAPI
```

In any point of your app you have to specify some authorization parameters

You must do it before the Authentication

```swift
SpotifyAPI.v1.auth.configuration = AuthorizationServiceConfiguration(clientId: "{ YOUR CLIENT ID }", 
                                                                     clientSecret: "{ YOUR CLIENT SECRET }", 
                                                                     redirectUri: "{ YOUR REDIRECT URI }", 
                                                                     scopes: [Scopes.user_read_private, Scopes.user_read_email, Scopes.user_follow_read, Scopes.user_top_read, Scopes.user_library_read])
```

- Client ID: The client id provided from the SpotifyDevelopers Dashboard
- ClientSecret: The client sectret code provided from the SpotifyDevelopers Dashboard
- RedirectUri: Your own redirect URL to redirect to after authentication success OR failure
- Scopes: Specific scopes to request during the authentication process

After you have setup the configuration you can now authenticate
```swift
SpotifyAPI.v1.auth.authenticate() { (newToken, errorResponse) in

    if let error = errorResponse{
        //Something gone wrong
        return
    }

    guard let accessToken = newToken else {
        //invalid access token
        return
    }
    //Authentication success

}
```

The Spotify's access token expire in 3600 seconds (generally), you can check if the session is still valid via API

- true: if the Session is expired (OR the user has not yet authenticated)
- false: the Session is still valid

```swift
SpotifyAPI.v1.auth.checkIfSessionIsExpired { (expired) in
    if(expired){
        // the session is expired
    }
    else{
        // the session is still valid, you can call any API
    }
}
```

if the session is not valid because the access token is expired you can refresh the access token via API


```swift
SpotifyAPI.v1.auth.refreshToken { (newAccessToken, errorResponse) in
    if let accessToken = newAccessToken{
        // refresh token success, you can call any API
    }
    else{
        // refresh token failed
        // user must authenticate again
    }
}
```

so you can easly manage the session refresh process in a few lines


```swift
SpotifyAPI.v1.auth.checkIfSessionIsExpired { (expired) in
    if(expired){
        SpotifyAPI.v1.auth.refreshToken { (newAccessToken, errorResponse) in
            if let accessToken = newAccessToken{
                // refresh token success, you can call any API
            }
            else{
                // refresh token failed
                // user must authenticate again
            }
        }
    }
    else{
        // the session is still valid, you can call any API
    }
}
```

#### Notes:

If you need to clear the authentication (like if you need to request some new scopes or start new authentication process)
you can clear the cookies with

```swift
SpotifyAPI.v1.auth.clearCookies()
```

#### Common API Calls

After you have completed the authorization process you can now start to interact with the SpotifyAPI

Example: Get User Profile
```swift
SpotifyAPI.v1.userProfile.getCurrentUserProfile { (userProfile, error) in
    if let responseError = error {
        //Something gone wrong
    }

    if let user = userProfile{
        // Success
    }
    else{
        //Something gone wrong
    }
}
```

### In the next releases
- #### Sample app (:star: SOON :star:)
- Search for Item API
- Remove from Playlists API
- Premium's account API

### :warning: This Framework is still in development, some bugs may occur during use

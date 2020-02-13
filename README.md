# SpotifyWebAPI
Spotify web Api for iOS, include authentication services and all of the WebServices available from Spotify

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 
See deployment for notes on how to deploy the project on a live system.

## Installing

### CocoaPods

To integrate SpotifyWebAPI into your xCode project using CocoaPods, specify it in your ``` Podfile``` :

``` 
pod 'SpotifyWebAPI', :git => 'https://github.com/Rilissimo1/SpotifyWebAPI', :tag => '1.4' 
```

Then, run the following command:

```$ pod install```

This will download any library dependencies you do not already have in your project.

## Usage

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
                                                                     scopes: ["playlist-read-private", "user-read-private"])
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
        print(error)
        return
    }

    guard let accessToken = newToken else {
        //invalid access token
        return
    }
    print(accessToken)

}
```



### In the next update
- Search for Item API
- Remove from Playlists API

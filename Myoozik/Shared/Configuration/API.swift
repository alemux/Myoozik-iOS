
import Foundation


// MARK: - LastFMAPI

/// _LastFMAPI_ is a struct responsible for general Last FM API configurations
struct MyoozikAPI {
    
    static let baseURLString = "http://app.myoozik.live/json/"
    //static let apiKey = "foobar"
}


// MARK: - URLConvertible

/// _URLConvertible_ is a protocol to implement urls
protocol URLConvertible {
    
    //func url() -> URL?
}


// MARK: - LastFMAPIEndpoint

/// _LastFMAPIEndpoint_ is an enumeration of all Last FM types of API requests
///
/// - getTopArtists: The get top artists request
/// - getTopAlbums:  The get top albums request
enum MyoozikAPIEndpoint {
    
    case getHome()
    case getEvent()
    //case getTopAlbums(String, Int)
}


// MARK: - URLConvertible

extension MyoozikAPIEndpoint: URLConvertible {

    
    
    func url() -> String? {
        
        switch self {
            
        case .getHome():
            
            return "\(MyoozikAPI.baseURLString)app_home.asp"
            
        case .getEvent():
            
            return "\(MyoozikAPI.baseURLString)app_event.asp"
            //return URL(string: "\(MyoozikAPI.baseURLString)?method=\(method)&api_key=\(LastFMAPI.apiKey)&format=json&limit=\(limit)")
            
        /*case .getTopAlbums(let artistId, let limit):
            
            let method = "artist.gettopalbums"
            
            return URL(string: "\(LastFMAPI.baseURLString)?method=\(method)&api_key=\(LastFMAPI.apiKey)&mbid=\(artistId)&format=json&limit=\(limit)")*/
        }
    }
}


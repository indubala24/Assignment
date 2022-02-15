//
//  RequestBuilder.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 13/02/22.
//

import Foundation
import Alamofire

fileprivate let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
fileprivate let currentLocale = "en-US"

struct BaseUrl {
    static let movieBaseUrl = "https://api.themoviedb.org/3/"
    static let baseImageUrl = "https://image.tmdb.org/t/p/"
}

enum APIRequestBuilder {
    case getMovieList
    case getMovieDetail(movieId: String)

}

extension APIRequestBuilder {
    var method: HTTPMethod {
        switch self {
        case .getMovieList, .getMovieDetail:
            return .get
        }
    }
}

extension APIRequestBuilder {
    private func endPoint() -> String {
        switch self {
        case .getMovieList:
            return "discover/movie?api_key=\(apiKey)"
        case let .getMovieDetail(movieId):
            return "movie/\(movieId)?api_key=\(apiKey)&language=\(currentLocale)"
        }
    }

    var requestUrl: String {
        BaseUrl.movieBaseUrl + endPoint()
    }

}

extension APIRequestBuilder {
    var headers: HTTPHeaders {
        return [:]
    }

    var parameters: [String: Any]? {
        return nil
    }
}


//
//  MoviewDetail.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import Foundation

struct MovieDetailModel: Codable {
    let originalTitle, overview, posterPath, releaseDate, tagline: String
    let runtime, voteCount: Int
    let voteAverage: Double
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case genres, overview, runtime, tagline
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}

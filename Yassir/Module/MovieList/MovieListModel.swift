//
//  MovieListModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit



struct MovieListModel: Codable {
    let results: [MovieDataModel]
}

struct MovieDataModel: Codable {
    let title, releaseDate, posterPath, overview: String
    let id: Int
    enum CodingKeys: String, CodingKey {
    case title, overview, id
    case releaseDate = "release_date"
    case posterPath = "poster_path"
    }
}

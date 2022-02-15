//
//  MovieDataTableCellViewModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import Foundation

class MovieDataTableCellViewModel {

    var data: MovieDetailModel

    init(data: MovieDetailModel) {
        self.data = data
    }

    var movieTitle: String {
        return data.originalTitle
    }

    var releaseYear: String {
        return data.releaseDate.components(separatedBy: "-").first ?? ""
    }

    var ratingAndDuration: String {
        "\(data.voteAverage)/10.0  (\(data.voteCount))  |  \(data.runtime)min"
    }

    var genreList: String {
        guard let firsGenre = data.genres.first?.name else { return "" }
        var genreListString = firsGenre
        for genre in data.genres.dropFirst() {
            genreListString += ", \(genre.name)"
        }
        return genreListString
    }

    var movieOverview: String {
        return data.overview
    }

    var tagLine: String {
        return #""\#(data.tagline)""#
    }
}

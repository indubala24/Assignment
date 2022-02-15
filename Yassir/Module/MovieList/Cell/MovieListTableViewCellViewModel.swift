//
//  MovieListTableViewCellViewModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit

class MovieListTableViewCellViewModel: NSObject {
    let data: MovieDataModel
    init(data: MovieDataModel) {
        self.data = data
    }

    var movieTitle: String {
        return data.title
    }

    var year: String {
        return data.releaseDate.components(separatedBy: "-").first ?? ""
    }

    var moviePosterUrlString: String {
        return (BaseUrl.baseImageUrl + "/w500/" + data.posterPath)
    }

    var movieOverView: String {
        return data.overview
    }
    
}

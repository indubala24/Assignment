//
//  MovieDetailViewModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit

enum MovieDetailRow: Int, CaseIterable {
    case imageData
    case movieData
}

class MovieDetailViewModel {

    let movieId: String
    var data: MovieDetailModel?
    var movieRows: [MovieDetailRow] = MovieDetailRow.allCases
    var reloadDataHandler: ((Any?)-> Void)?

    init(movieId: String) {
        self.movieId = movieId
    }

    func fetchMovieDetailData() {
        self.data = nil
        let request = APIRequestBuilder.getMovieDetail(movieId: self.movieId)
        APIRequester.sharedInstance.performRequestWith(request: request) { [weak self] (response, status, errorMessage, error) in
            guard let self = self else { return }
            if let data = response as? [String: Any] {
                self.data = NSObject.parseObject(MovieDetailModel.self, data: data)
            }
            self.reloadDataHandler?(true)
        }
    }

}

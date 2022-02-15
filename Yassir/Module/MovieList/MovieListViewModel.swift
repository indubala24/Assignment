//
//  MovieListViewModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 14/02/22.
//

import UIKit

class MovieListViewModel: NSObject {

    var dataModel: MovieListModel?

    var reloadDataHandler: ((Any?)-> Void)?

    func fetchMoviewList() {
        self.dataModel = nil
        let request = APIRequestBuilder.getMovieList
        APIRequester.sharedInstance.performRequestWith(request: request) { [weak self] (response, status, errorMessage, error) in
            guard let self = self else { return }
            if let data = response as? [String: Any] {
                self.dataModel = NSObject.parseObject(MovieListModel.self, data: data)
            }
            self.reloadDataHandler?(true)
        }
    }

    var numberOfMovies: Int {
        return self.dataModel?.results.count ?? 0
    }
}

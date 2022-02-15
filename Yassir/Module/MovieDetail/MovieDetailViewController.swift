//
//  MovieDetailViewController.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieDetailTableView: UITableView!

    var viewModel: MovieDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        registerCell()
        setUpBinding()
        viewModel?.fetchMovieDetailData()
    }

    private func setDelegate() {
        movieDetailTableView.delegate = self
        movieDetailTableView.dataSource = self
    }

    private func registerCell() {
        let imageNibStr = String(describing: DetailImageTableViewCell.self)
        movieDetailTableView.register(UINib(nibName: imageNibStr, bundle: nil), forCellReuseIdentifier: imageNibStr.lowercased())
        let moviewDataNibStr = String(describing: MovieDataTableViewCell.self)
        movieDetailTableView.register(UINib(nibName: moviewDataNibStr, bundle: nil), forCellReuseIdentifier: moviewDataNibStr.lowercased())
    }

    private func setUpBinding() {
        viewModel?.reloadDataHandler = { [weak self] (_) in
            guard let self = self else { return }
            self.movieDetailTableView.reloadData()
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movieRows.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieRow = viewModel?.movieRows[indexPath.row] else { return UITableViewCell() }
        switch movieRow {
        case .imageData:
            let identifier = DetailImageTableViewCell.reuseIdentifier()
            guard let movieImageCell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                                     for: indexPath) as? DetailImageTableViewCell else {
                return UITableViewCell()
            }
            movieImageCell.setData(data: DetailImageTableViewCellViewModel(imageStr: viewModel?.data?.posterPath ?? ""))
            return movieImageCell
        case .movieData:
            let identifier = MovieDataTableViewCell.reuseIdentifier()
            guard let movieDataCell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                                     for: indexPath) as? MovieDataTableViewCell else {
                return UITableViewCell()
            }
            guard let data = viewModel?.data else { return MovieDataTableViewCell() }
            movieDataCell.setData(data: MovieDataTableCellViewModel(data: data))
            return movieDataCell
        }
    }
}

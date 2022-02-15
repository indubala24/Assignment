//
//  ViewController.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 13/02/22.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTableView: UITableView!

    var viewModel: MovieListViewModel = MovieListViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
        setDelegate()
        registerCell()
        setUpBinding()
        viewModel.fetchMoviewList()
    }

    private func setNavigationBar() {
        self.title = "THE MOVIE DB"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 27.0/255.0, blue: 52.0/255.0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 30.0/255.0, green: 170.0/255.0, blue: 206/255.0, alpha: 1)]
    }

    private func setDelegate() {
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
    }

    private func registerCell() {
        let cellNibStr = String(describing: MovieListTableViewCell.self)
        movieListTableView.register(UINib(nibName: cellNibStr, bundle: nil), forCellReuseIdentifier: cellNibStr.lowercased())
    }

    private func setUpBinding() {
        viewModel.reloadDataHandler = { [weak self] (_) in
            guard let self = self else { return }
            self.movieListTableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = MovieListTableViewCell.reuseIdentifier()
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                         for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        guard let data = viewModel.dataModel?.results[indexPath.row] else { return movieCell }
        movieCell.model = MovieListTableViewCellViewModel(data: data)
        return movieCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieId = viewModel.dataModel?.results[indexPath.row].id else { return }
        showMovieDetail(movieId: "\(movieId)")
    }

    func showMovieDetail(movieId: String) {
            if let viewController = AppConstant.Storyboard.main.relativeInstance.instantiateViewController(
                withIdentifier: AppConstant.ViewControllers.movieDetailVC
            ) as? MovieDetailViewController {
                viewController.viewModel = MovieDetailViewModel.init(movieId: movieId)
                self.navigationController?.pushViewController(viewController, animated: true)
            }
    }
    
}

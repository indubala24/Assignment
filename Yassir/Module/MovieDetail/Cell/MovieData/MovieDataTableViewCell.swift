//
//  MovieDataTableViewCell.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit

class MovieDataTableViewCell: UITableViewCell {

    var viewModel: MovieDataTableCellViewModel?
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var releaseYearLbl: UILabel!
    @IBOutlet weak var ratingDurationLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var tagLineLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: MovieDataTableCellViewModel) {
        self.viewModel = data
        displayData()
    }

    private func displayData() {
        guard let viewModel = viewModel else { return }
        movieTitleLbl.text = viewModel.movieTitle
        releaseYearLbl.text = viewModel.releaseYear
        ratingDurationLbl.text = viewModel.ratingAndDuration
        genreLbl.text = viewModel.genreList
        descriptionLbl.text = viewModel.movieOverview
        tagLineLbl.text = viewModel.tagLine
    }

    class func reuseIdentifier() -> String {
        return String(describing: self).lowercased()
    }

}

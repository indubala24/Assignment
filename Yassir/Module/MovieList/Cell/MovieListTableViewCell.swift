//
//  MovieListTableViewCell.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 14/02/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var movieYearLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var model: MovieListTableViewCellViewModel? {
        didSet {
            displayData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func displayData() {
        guard let model = model else { return }
        self.movieNameLbl.text = model.movieTitle
        self.movieYearLbl.text = model.year
        self.descriptionLbl.text = model.movieOverView
        self.thumbNailImageView.load(urlString: model.moviePosterUrlString)
    }

    class func reuseIdentifier() -> String {
        return String(describing: self).lowercased()
    }
}

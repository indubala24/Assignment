//
//  DetailImageTableViewCell.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!

    var viewModel: DetailImageTableViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(data: DetailImageTableViewCellViewModel) {
        self.viewModel = data
        displayData()
    }

    private func displayData() {
        guard let viewModel = viewModel else { return }
        self.moviePosterImageView.load(urlString: viewModel.moviePosterUrlString)
    }

    class func reuseIdentifier() -> String {
        return String(describing: self).lowercased()
    }
}

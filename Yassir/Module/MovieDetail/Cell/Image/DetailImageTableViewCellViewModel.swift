//
//  DetailImageTableViewCellViewModel.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import Foundation

class DetailImageTableViewCellViewModel {
    let imageStr: String
    init(imageStr: String) {
        self.imageStr = imageStr
    }

    var moviePosterUrlString: String {
        return (BaseUrl.baseImageUrl + "/original" + self.imageStr)
    }
}

//
//  AppConstant.swift
//  Yassir
//
//  Created by Indubala Jayachandran on 15/02/22.
//

import UIKit
struct AppConstant {
    enum Storyboard: String {
        case main = "Main"
        
        var relativeInstance: UIStoryboard {
            return UIStoryboard(name: rawValue, bundle: nil)
        }
        
        var instantiateInitialViewController: UIViewController? {
            return relativeInstance.instantiateInitialViewController()
        }
    }
}

extension AppConstant {
    struct ViewControllers {
        static let movieDetailVC = "MovieDetailViewController"
    }
}

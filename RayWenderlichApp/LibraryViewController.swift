//
//  ViewController.swift
//  RayWenderlichApp
//
//  Created by Kiyoshi Woolheater on 6/30/21.
//

import UIKit

class LibraryViewController: UIViewController {

    var libraryViewModel: LibraryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryViewModel = LibraryViewModel()
        libraryViewModel?.loadArticlesData() { result in
            switch result {
            case true:
                print("")
//                print(self.libraryViewModel?.articleModel)
            case false:
                print("error")
            }
        }
        
        libraryViewModel?.loadVideosData() { result in
            switch result {
            case true:
                print(self.libraryViewModel?.videosModel)
            case false:
                print("error")
            }
        }
    }
    
}


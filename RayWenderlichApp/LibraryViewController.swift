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
        libraryViewModel?.loadData()
        print(libraryViewModel?.articleModel)
    }
    
}


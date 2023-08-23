//
//  LibraryViewModel.swift
//  RayWenderlichApp
//
//  Created by Woolheater, Kiyoshi on 8/18/23.
//

import Foundation

class LibraryViewModel {
    
    var articleModel: ArticleModel?
    var articlesUrl = "https://raw.githubusercontent.com/kodecocodes/ios-interview/master/Practical%20Example/articles.json"
    
    func loadData() {
        Networking().fetchData(urlString: articlesUrl) { (result : Result<ArticleModel, NetworkingError>) in
            switch result {
                case .success(let model): self.articleModel = model
                case .failure(let error): print(error)
            }
        }
    }
}

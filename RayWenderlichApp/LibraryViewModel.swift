//
//  LibraryViewModel.swift
//  RayWenderlichApp
//
//  Created by Woolheater, Kiyoshi on 8/18/23.
//

import Foundation

class LibraryViewModel {
    
    var articleModel: ArticleModel?
    var videosModel: ArticleModel?
    var articlesUrl = "https://raw.githubusercontent.com/kodecocodes/ios-interview/master/Practical%20Example/articles.json"
    var videosUrl = "https://raw.githubusercontent.com/kodecocodes/ios-interview/master/Practical%20Example/videos.json"
    
    func loadArticlesData(completion: @escaping (Bool) -> Void) {
        Networking().fetchData(urlString: articlesUrl) { (result: Result<ArticleModel, NetworkingError>) in
            switch result {
                case .success(let model):
                    self.articleModel = model
                    completion(true)
                case .failure(let error):
                    completion(false)
            }
        }
    }
    
    func loadVideosData(completion: @escaping (Bool) -> Void) {
        Networking().fetchData(urlString: videosUrl) { (result: Result<ArticleModel, NetworkingError>) in
            switch result {
                case .success(let model):
                    self.videosModel = model
                    completion(true)
                case .failure(let error):
                    completion(false)
            }
        }
    }
}

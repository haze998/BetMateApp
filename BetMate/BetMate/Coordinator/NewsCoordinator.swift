//
//  NewsCoordinator.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 29.05.2023.
//

import Foundation
import UIKit

class NewsCoordinator : Coordinator {
    weak var parentCoordinator: Coordinator?
    var childrenCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToNewsPage()
    }
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToNewsPage() {
        let viewModel = NewsViewModel(coordinator: self)
        let newsVC = NewsViewController(viewModel: viewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(newsVC, animated: true)
    }
    
    func goToDetailNews(with sportsNews: NewsArticle) {
        let viewModel = DetailViewModel(coordinator: self, news: sportsNews)
        let vc = DetailNewsViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

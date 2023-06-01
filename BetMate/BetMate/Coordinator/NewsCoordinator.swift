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
        // Instantiate ViewController
        let viewModel = NewsViewModel(coordinator: self)
        let newsVC = NewsViewController(viewModel: viewModel)
        navigationController.navigationBar.isHidden = true
        // Instantiate ViewModel
//        let viewModel =  OnboardingViewModel.init()
        // Set the Coordinator to the ViewModel
//        viewModel.coordinator = self
        // Set the ViewModel to ViewController
//        onboardVC.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(newsVC, animated: true)
    }
    
    func goToDetailNews(with sportsNews: NewsArticle) {
        let viewModel = DetailViewModel(coordinator: self, news: sportsNews)
        let vc = DetailNewsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    // TODO: - If we logout call this method
//    func goToLogout() {
//        childrenCoordinator.removeAll()
//        let appC = AppCoordinator(navigationController: navigationController)
//        appC.childrenCoordinator.append(appC)
//        appC.start()
//    }
}

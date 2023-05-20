//
//  NewsViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 14.05.2023.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController {
    
    // MARK: - Private properties
    private let router: AuthRouter = Router.shared
    private let viewModel = NewsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 270
        tableView.backgroundColor = .clear
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: String(describing: NewsTableViewCell.self))
        return tableView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .labelColor
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        label.text = "News"
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchedNews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.view.backgroundColor = .background
        

//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidTap))
//        navigationController?.navigationBar.prefersLargeTitles = true
//        let largeTitleTextAttr = [
//            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
//            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
//        ]
//        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
//        title = "News"
    }
    
    private func fetchedNews() {
        viewModel.fetchedNews {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Selectors
//    @objc
//    private func logoutButtonDidTap() {
//        AuthNetworkManager.shared.signOutUser { [weak self] wasLogout, error in
//            guard let self = self else { return }
//            if let error = error {
//                AlertManager.showLogoutErrorAlert(on: self, with: error)
//                return
//            }
//            
////            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
////                sceneDelegate.checkDefaultUserAuth()
////            }
//            switch wasLogout {
//            case true:
//                router.showLogout(from: self)
//            case false:
//                return
//            }
//        }
//    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        view.addSubviews(view: [titleLabel, tableView])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.left.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            
        }
    }
}

// MARK: - Extensions
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sportNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self)) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configureCell(with: viewModel.sportNews[indexPath.row])
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {}

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
    var viewModel = NewsViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 335
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
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
    
    private lazy var customScrollUpButton: CustomScrollUpButton = {
        let button = CustomScrollUpButton(frame: CGRect(x: 300, y: 680, width: 50, height: 50))
        return button
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 {
            customScrollUpButton.isHidden = false
        } else {
            customScrollUpButton.isHidden = true
        }
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.view.backgroundColor = .background
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidTap))
    }
    
    private func fetchedNews() {
        viewModel.fetchedNews {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Selectors
    @objc
    private func logoutButtonDidTap() {
        AuthNetworkManager.shared.signOutUser { [weak self] wasLogout, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
            switch wasLogout {
            case true:
                print("TAP")
            case false:
                return
            }
        }
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        view.addSubviews(view: [titleLabel, tableView, customScrollUpButton])
        
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

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNews = viewModel.sportNews[indexPath.row]
        let detailVC = DetailNewsViewController()
        detailVC.selectedNews = selectedNews
//        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//
//  GamesViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 16.05.2023.
//

import UIKit
import SnapKit

class GamesViewController: UIViewController {
    
    // MARK: Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .labelColor
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        label.text = "Games"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(SportsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SportsCollectionViewCell.self))
        return collectionView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 335
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(FootballTableViewCell.self, forCellReuseIdentifier: String(describing: FootballTableViewCell.self))
        return tableView
    }()
    
    let viewModel = GamesViewModel()
    private let sportArr = [
        Sport(sportName: "football",
              icon: UIImage(named: "football") ?? UIImage()),
        Sport(sportName: "baseball",
              icon: UIImage(named: "baseball") ?? UIImage()),
        Sport(sportName: "basketball",
              icon: UIImage(named: "basketball") ?? UIImage()),
        Sport(sportName: "formula1",
              icon: UIImage(named: "formula1") ?? UIImage()),
        Sport(sportName: "handball",
              icon: UIImage(named: "handball") ?? UIImage()),
        Sport(sportName: "hockey",
              icon: UIImage(named: "hockey") ?? UIImage()),
        Sport(sportName: "rugby",
              icon: UIImage(named: "rugby") ?? UIImage()),
        Sport(sportName: "volleyball",
              icon: UIImage(named: "volleyball") ?? UIImage()),
    ]
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        collectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .background
    }
    
    // MARK: - Private functions
    private func fetchedFootballInfo() {
        viewModel.getFootballInfo {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Create compositional layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            return self.collectionView.sportSectionLayout()
        }
    }
    
    // MARK: - Setup layout
    private func setupConstraints() {
        self.view.addSubviews(view: [titleLabel, collectionView, tableView])
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.left.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - CollectionView extensions DataSource / Delegate
extension GamesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sportArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SportsCollectionViewCell.self), for: indexPath) as? SportsCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(with: sportArr[indexPath.row])
        return cell
    }
}

extension GamesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            fetchedFootballInfo()
//        case 1:
//        case 2:
//        case 3:
//        case 4:
//        case 5:
//        case 6:
//        case 7:
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // the first cell in the collection will always be selected by default
        if indexPath.item == 0 && indexPath.section == 0 {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
            collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }
}

// MARK: - TableView extensions DataSource / Delegate
extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.footballInfoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FootballTableViewCell.self)) as? FootballTableViewCell else { return UITableViewCell() }
        cell.configureCell(with: viewModel.footballInfoArr[indexPath.row])
        return cell
    }
}

extension GamesViewController: UITableViewDelegate { }

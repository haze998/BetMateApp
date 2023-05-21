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
        tableView.register(BasketballTableViewCell.self, forCellReuseIdentifier: String(describing: BasketballTableViewCell.self))
        return tableView
    }()
    
    private let sportArr = [
        GamesViewModel(sport: Sport(sportName: "football", icon: UIImage(named: "football") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "baseball", icon: UIImage(named: "baseball") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "basketball", icon: UIImage(named: "basketball") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "formula 1", icon: UIImage(named: "formula1") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "handball", icon: UIImage(named: "handball") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "hockey", icon: UIImage(named: "hockey") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "rugby", icon: UIImage(named: "rugby") ?? UIImage())),
        GamesViewModel(sport: Sport(sportName: "volleyball", icon: UIImage(named: "volleyball") ?? UIImage()))
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
        
        // Deselect the previously selected cell, if there is one
        if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first,
           let selectedCell = collectionView.cellForItem(at: selectedIndexPath) as? SportsCollectionViewCell {
            selectedCell.isSelected = false
        }
        
        // Highlight the selected cell
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? SportsCollectionViewCell {
            selectedCell.isSelected = true
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketballTableViewCell.self)) as? BasketballTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension GamesViewController: UITableViewDelegate { }

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
        
        FootballNtworkManager.shared.test()
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
        self.view.addSubviews(view: [titleLabel, collectionView])
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.left.equalTo(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - Extensions
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

extension GamesViewController: UICollectionViewDelegate { }

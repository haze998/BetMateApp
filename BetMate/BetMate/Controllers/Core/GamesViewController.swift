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
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: String(describing: GamesTableViewCell.self))
        return tableView
    }()
    
    private lazy var customScrollUpButton: CustomScrollUpButton = {
        let button = CustomScrollUpButton()
        button.addTarget(self, action: #selector(scrollUpButtonDidtap), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()
    
    let viewModel = GamesViewModel()
    private let sportArr = [
        Sport(sportName: "football",
              icon: UIImage(named: "football") ?? UIImage()),
        Sport(sportName: "baseball",
              icon: UIImage(named: "baseball") ?? UIImage()),
        Sport(sportName: "basketball",
              icon: UIImage(named: "basketball") ?? UIImage()),
        Sport(sportName: "hockey",
              icon: UIImage(named: "hockey") ?? UIImage()),
        Sport(sportName: "volleyball",
              icon: UIImage(named: "volleyball") ?? UIImage()),
        Sport(sportName: "handball",
              icon: UIImage(named: "handball") ?? UIImage())
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 {
            customScrollUpButton.isHidden = false
        } else {
            customScrollUpButton.isHidden = true
        }
    }

    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .background
    }
    
    // MARK: - Selectors
    @objc
    private func scrollUpButtonDidtap() {
        let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    // MARK: - Private functions
    private func footballInfo() {
        viewModel.fetchedFootballInfo {
            self.tableView.reloadData()
        }
    }
    
    private func baseballInfo() {
        viewModel.fetchedBaseballInfo {
            self.tableView.reloadData()
        }
    }
    
    private func basketballInfo() {
        viewModel.fetchedBasketballInfo {
            self.tableView.reloadData()
        }
    }
    
    private func hockeyInfo() {
        viewModel.fetchedHockeyInfo {
            self.tableView.reloadData()
        }
    }
    
    private func volleyballInfo() {
        viewModel.fetchedVolleyballInfo {
            self.tableView.reloadData()
        }
    }
    
    private func handballInfo() {
        viewModel.fetchedHandballInfo {
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
        self.view.addSubviews(view: [titleLabel, collectionView, tableView, customScrollUpButton])
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
        
        customScrollUpButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(100)
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
        case 0:
            viewModel.sports = .football
            footballInfo()
        case 1:
            viewModel.sports = .baseball
            baseballInfo()
        case 2:
            viewModel.sports = .basketball
            basketballInfo()
        case 3:
            viewModel.sports = .hockey
            hockeyInfo()
        case 4:
            viewModel.sports = .volleyball
            volleyballInfo()
        case 5:
            viewModel.sports = .handball
            handballInfo()
        default: break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // the first cell in the collection will always be selected by default
        if indexPath.item == 0 && indexPath.section == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            self.collectionView(collectionView, didSelectItemAt: indexPath)
            cell.isSelected = true
        }
    }
}

// MARK: - TableView extensions DataSource / Delegate
extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.sports {
        case .football:
            return viewModel.footballInfoArr.count
        case .baseball:
            return viewModel.baseballInfoArr.count
        case .basketball:
            return viewModel.basketballInfoArr.count
        case .hockey:
            return viewModel.hockeyInfoArr.count
        case .volleyball:
            return viewModel.volleyballInfoArr.count
        case .handball:
            return viewModel.handballInfoArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GamesTableViewCell.self)) as? GamesTableViewCell else { return UITableViewCell() }
        switch viewModel.sports {
        case .football:
            cell.configureFootballCell(with: viewModel.footballInfoArr[indexPath.row])
        case .baseball:
            cell.configureBaseballCell(with: viewModel.baseballInfoArr[indexPath.row])
        case .basketball:
            cell.configureBasketballCell(with: viewModel.basketballInfoArr[indexPath.row])
        case .hockey:
            cell.configureHockeyCell(with: viewModel.hockeyInfoArr[indexPath.row])
        case .volleyball:
            cell.configureVolleyballCell(with: viewModel.volleyballInfoArr[indexPath.row])
        case .handball:
            cell.configureHandballCell(with: viewModel.handballInfoArr[indexPath.row])
        }
        return cell
    }
}

extension GamesViewController: UITableViewDelegate { }

//
//  DetailGamesViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 08.06.2023.
//

import UIKit
import SnapKit
import SDWebImage

class DetailGamesViewController: UIViewController {
    
    var viewModel: DetailGamesViewModel
    
    init(viewModel: DetailGamesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.insetsLayoutMarginsFromSafeArea = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .background
        return contentView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailGamesCell.self, forCellReuseIdentifier: String(describing: DetailGamesCell.self))
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private var matchView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBackgroundView
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ImageNames.backArrow.rawValue), for: .normal)
        button.backgroundColor = .background
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var leftTeamLogo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.backgroundColor = .darkGray
        return image
    }()
    
    private lazy var rightTeamLogo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.backgroundColor = .darkGray
        return image
    }()
    
    private lazy var scoreView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var homeScore: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 30)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var colonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 30)
        label.text = ":"
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var awayScore: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 30)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var homeTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var awayTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var homeAwayOddslabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.text = "home / away"
        label.textColor = .labelColor
        return label
    }()
    
    private let homeOdds = InfoLabel(labelType: .homeOdds)
    private let awayOdds = InfoLabel(labelType: .awayOdds)
    private let oddsInfoLabel = InfoLabel(labelType: .oddsInfo)
    private let oddsDevider = DeviderView()
    private let matchInfoLabel = InfoLabel(labelType: .matchInfo)
    private let matchInfoDevider = DeviderView()
    private let headToHeadInfo = InfoLabel(labelType: .headToHead)
    private let headToHeadDevider = DeviderView()
    private let matchCountry = InfoLabel(labelType: .matchCountry)
    private let matchLeague = InfoLabel(labelType: .matchLeague)
    private let matchDateInfo = InfoLabel(labelType: .matchDate)
    private let seasonDate = InfoLabel(labelType: .seasonDate)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchedOddsInfo()
        fetchedHthInfo()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        if let footballInfo = viewModel.football {
            let footballHomeImgURL = URL(string: footballInfo.teams.home.logo)
            let footballAwayImgURL = URL(string: footballInfo.teams.away.logo)
            leftTeamLogo.sd_setImage(with: footballHomeImgURL)
            rightTeamLogo.sd_setImage(with: footballAwayImgURL)
            homeScore.text = "\(footballInfo.goals.home ?? 0)"
            awayScore.text = "\(footballInfo.goals.away ?? 0)"
            homeTeamName.text = footballInfo.teams.home.name
            awayTeamName.text = footballInfo.teams.away.name
            matchDate.text = footballInfo.fixture.date.formatDateString(footballInfo.fixture.date)
            matchCountry.text = "Country :" + " " + (footballInfo.league.country)
            matchLeague.text = "League :" + " " + (footballInfo.league.name)
            matchDateInfo.text = "Date :" + " " + (footballInfo.fixture.date.formatDateString(footballInfo.fixture.date) ?? "")
            seasonDate.text = "Season : \(footballInfo.league.season)"
        } else if let baseballInfo = viewModel.baseball {
            let homeImgURL = URL(string: baseballInfo.teams?.home?.logo ?? "")
            let awayImgURL = URL(string: baseballInfo.teams?.away?.logo ?? "")
            leftTeamLogo.sd_setImage(with: homeImgURL)
            rightTeamLogo.sd_setImage(with: awayImgURL)
            homeScore.text = "\(baseballInfo.scores?.home?.total ?? 0)"
            awayScore.text = "\(baseballInfo.scores?.away?.total ?? 0)"
            homeTeamName.text = baseballInfo.teams?.home?.name
            awayTeamName.text = baseballInfo.teams?.away?.name
            matchDate.text = baseballInfo.date?.formatDateString(baseballInfo.date ?? "")
            matchDateInfo.text = "Date :" + " " + (baseballInfo.date?.formatDateString(baseballInfo.date ?? "") ?? "")
            seasonDate.text = "Season : \(baseballInfo.league?.season ?? 0)"
        } else if let basketballInfo = viewModel.basketball {
            let homeImgURL = URL(string: basketballInfo.teams?.home?.logo ?? "")
            let awayImgURL = URL(string: basketballInfo.teams?.away?.logo ?? "")
            leftTeamLogo.sd_setImage(with: homeImgURL)
            rightTeamLogo.sd_setImage(with: awayImgURL)
            homeScore.text = "\(basketballInfo.scores?.home?.total ?? 0)"
            awayScore.text = "\(basketballInfo.scores?.away?.total ?? 0)"
            homeTeamName.text = basketballInfo.teams?.home?.name
            awayTeamName.text = basketballInfo.teams?.away?.name
            matchDate.text = basketballInfo.date?.formatDateString(basketballInfo.date ?? "")
            matchDateInfo.text = "Date :" + " " + (basketballInfo.date?.formatDateString(basketballInfo.date ?? "") ?? "")
            seasonDate.text = "Season : \(basketballInfo.league?.name ?? "")"
        } else if let hockeyInfo = viewModel.hockey {
            let homeImgURL = URL(string: hockeyInfo.teams?.home?.logo ?? "")
            let awayImgURL = URL(string: hockeyInfo.teams?.away?.logo ?? "")
            leftTeamLogo.sd_setImage(with: homeImgURL)
            rightTeamLogo.sd_setImage(with: awayImgURL)
            homeScore.text = "\(hockeyInfo.scores?.home ?? 0)"
            awayScore.text = "\(hockeyInfo.scores?.away ?? 0)"
            homeTeamName.text = hockeyInfo.teams?.home?.name
            awayTeamName.text = hockeyInfo.teams?.away?.name
            matchDate.text = hockeyInfo.date?.formatDateString(hockeyInfo.date ?? "")
            matchDateInfo.text = "Date :" + " " + (hockeyInfo.date?.formatDateString(hockeyInfo.date ?? "") ?? "")
            seasonDate.text = "Season : \(hockeyInfo.league?.season ?? 0)"
        } else if let volleyballInfo = viewModel.volleyball {
            let homeImgURL = URL(string: volleyballInfo.teams?.home?.logo ?? "")
            let awayImgURL = URL(string: volleyballInfo.teams?.away?.logo ?? "")
            leftTeamLogo.sd_setImage(with: homeImgURL)
            rightTeamLogo.sd_setImage(with: awayImgURL)
            homeScore.text = "\(volleyballInfo.scores?.home ?? 0)"
            awayScore.text = "\(volleyballInfo.scores?.away ?? 0)"
            homeTeamName.text = volleyballInfo.teams?.home?.name
            awayTeamName.text = volleyballInfo.teams?.away?.name
            matchDate.text = volleyballInfo.date?.formatDateString(volleyballInfo.date ?? "")
            matchDateInfo.text = "Date :" + " " + (volleyballInfo.date?.formatDateString(volleyballInfo.date ?? "") ?? "")
            seasonDate.text = "Season : \(volleyballInfo.league?.season ?? 0)"
        } else if let handballInfo = viewModel.handball {
            let homeImgURL = URL(string: handballInfo.teams?.home?.logo ?? "")
            let awayImgURL = URL(string: handballInfo.teams?.away?.logo ?? "")
            leftTeamLogo.sd_setImage(with: homeImgURL)
            rightTeamLogo.sd_setImage(with: awayImgURL)
            homeScore.text = "\(handballInfo.scores?.home ?? 0)"
            awayScore.text = "\(handballInfo.scores?.away ?? 0)"
            homeTeamName.text = handballInfo.teams?.home?.name
            awayTeamName.text = handballInfo.teams?.away?.name
            matchDate.text = handballInfo.date?.formatDateString(handballInfo.date ?? "")
            matchDateInfo.text = "Date :" + " " + (handballInfo.date?.formatDateString(handballInfo.date ?? "") ?? "")
            seasonDate.text = "Season : \(handballInfo.league?.season ?? 0)"
        }
    }
    
    // MARK: - Private funcs
    private func fetchedOddsInfo() {
        if viewModel.football != nil {
            viewModel.fetchFootballOdds {
                self.homeOdds.text = self.viewModel.footballOddsArr.first?.bookmakers?[0].bets?.first?.values?[0].odd ?? "no oods"
                self.awayOdds.text = self.viewModel.footballOddsArr.first?.bookmakers?[0].bets?.first?.values?[2].odd ?? "no odds"
            }
        } else if viewModel.baseball != nil {
            viewModel.fetchBaseballOdds {
                self.homeOdds.text = self.viewModel.baseballOddsArr.first?.bookmakers?[0].bets?.first?.values?[0].odd ?? "no oods"
                self.awayOdds.text = self.viewModel.baseballOddsArr.first?.bookmakers?[0].bets?.first?.values?[2].odd ?? "no odds"
            }
        } else if viewModel.basketball != nil {
            viewModel.fetchBasketballOdds {
                self.homeOdds.text = self.viewModel.baseballOddsArr.first?.bookmakers?[0].bets?.first?.values?[0].odd ?? "no oods"
                self.awayOdds.text = self.viewModel.baseballOddsArr.first?.bookmakers?[0].bets?.first?.values?[2].odd ?? "no odds"
            }
        } else if viewModel.hockey != nil {
            viewModel.fetchHockeyOdds {
                self.homeOdds.text = self.viewModel.hockeyOddsArr.first?.bookmakers?[0].bets?.first?.values?[0].odd ?? "no oods"
                self.awayOdds.text = self.viewModel.hockeyOddsArr.first?.bookmakers?[0].bets?.first?.values?[2].odd ?? "no odds"
            }
        } else if viewModel.volleyball != nil {
            viewModel.fetchVolleyballOdds {
                self.homeOdds.text = self.viewModel.volleyballOddsArr.first?.bookmakers?[0].bets?.first?.values?[0].odd ?? "no oods"
                self.awayOdds.text = self.viewModel.volleyballOddsArr.first?.bookmakers?[0].bets?.first?.values?[1].odd ?? "no odds"
            }
        } else if viewModel.handball != nil {
            self.homeOdds.text = "no oods"
            self.awayOdds.text = "no odds"
        }
    }
    
    private func fetchedHthInfo() {
        if viewModel.football != nil {
            viewModel.fetchHtHFootbal {
                self.tableView.reloadData()
            }
        } else if viewModel.baseball != nil {
            viewModel.fetchHtHBaseball {
                self.tableView.reloadData()
            }
        } else if viewModel.basketball != nil {
            viewModel.fetchHtHbasketball {
                self.tableView.reloadData()
            }
        } else if viewModel.hockey != nil {
            viewModel.fetchHtHhockey {
                self.tableView.reloadData()
            }
        } else if viewModel.volleyball != nil {
            viewModel.fetchHtHVolleyball {
                self.tableView.reloadData()
            }
        } else if viewModel.handball != nil {
            viewModel.fetchHtHHandball {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Selectors
    @objc
    private func backButtonDidTap() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(view: [matchView, matchInfoLabel, matchInfoDevider, oddsInfoLabel, oddsDevider, homeAwayOddslabel, homeOdds, awayOdds, matchCountry, matchLeague, matchDateInfo, seasonDate, headToHeadInfo, headToHeadDevider, tableView])
        matchView.addSubviews(view: [backButton, leftTeamLogo, rightTeamLogo, scoreView, homeTeamName, awayTeamName, matchDate])
        scoreView.addSubviews(view: [homeScore, colonLabel, awayScore])
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(-60)
            make.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(scrollView)
            make.height.equalTo(1380)
            scrollView.isScrollEnabled = true
        }
        
        matchView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.top.leading.trailing.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalTo(60)
            make.left.equalTo(16)
        }
        
        leftTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        rightTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }
        
        scoreView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(leftTeamLogo)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        homeScore.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.centerY.equalToSuperview()
        }
        
        colonLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(1)
        }
        
        awayScore.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(0)
            make.centerY.equalToSuperview()
        }
        
        homeTeamName.snp.makeConstraints { make in
            make.top.equalTo(leftTeamLogo.snp_bottomMargin).offset(20)
            make.width.equalTo(100)
            make.left.equalTo(20)
        }
        
        awayTeamName.snp.makeConstraints { make in
            make.top.equalTo(rightTeamLogo.snp_bottomMargin).offset(20)
            make.width.equalTo(100)
            make.right.equalToSuperview().inset(20)
        }
        
        matchDate.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
        
        oddsInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(matchView.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
        }
        
        oddsDevider.snp.makeConstraints { make in
            make.top.equalTo(oddsInfoLabel.snp_bottomMargin).offset(5)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        homeAwayOddslabel.snp.makeConstraints { make in
            make.top.equalTo(oddsDevider.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        homeOdds.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.centerY.equalTo(homeAwayOddslabel)
        }
        
        awayOdds.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(40)
            make.centerY.equalTo(homeAwayOddslabel)
        }
        
        matchInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(homeAwayOddslabel.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
        }
        
        matchInfoDevider.snp.makeConstraints { make in
            make.top.equalTo(matchInfoLabel.snp_bottomMargin).offset(5)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        matchCountry.snp.makeConstraints { make in
            make.top.equalTo(matchInfoDevider.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        matchLeague.snp.makeConstraints { make in
            make.top.equalTo(matchCountry.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        matchDateInfo.snp.makeConstraints { make in
            make.top.equalTo(matchLeague.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        seasonDate.snp.makeConstraints { make in
            make.top.equalTo(matchDateInfo.snp_bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        headToHeadInfo.snp.makeConstraints { make in
            make.top.equalTo(seasonDate.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
        }
        
        headToHeadDevider.snp.makeConstraints { make in
            make.top.equalTo(headToHeadInfo.snp_bottomMargin).offset(5)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headToHeadDevider.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITableView Data Source
extension DetailGamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.football != nil {
            return viewModel.footballHthArr.count
        } else if viewModel.baseball != nil {
            return viewModel.baseballHthArr.count
        } else if viewModel.basketball != nil {
            return viewModel.basketballHthArr.count
        } else if viewModel.hockey != nil {
            return viewModel.hockeyHthArr.count
        } else if viewModel.volleyball != nil {
            return viewModel.volleyballHthArr.count
        } else if viewModel.handball != nil {
            return viewModel.handballHthArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailGamesCell.self), for: indexPath) as? DetailGamesCell else { return UITableViewCell() }
        if viewModel.football != nil {
            cell.configureCell(with: viewModel.footballHthArr[indexPath.row])
        } else if viewModel.baseball != nil {
            cell.configureCell(with: viewModel.baseballHthArr[indexPath.row])
        } else if viewModel.basketball != nil {
            cell.configureCell(with: viewModel.basketballHthArr[indexPath.row])
        } else if viewModel.hockey != nil {
            cell.configureCell(with: viewModel.hockeyHthArr[indexPath.row])
        } else if viewModel.volleyball != nil {
            cell.configureCell(with: viewModel.volleyballHthArr[indexPath.row])
        } else if viewModel.handball != nil {
            cell.configureCell(with: viewModel.handballHthArr[indexPath.row])
        }
        return cell
    }
}

// MARK: UITableView Delegate
extension DetailGamesViewController: UITableViewDelegate {}

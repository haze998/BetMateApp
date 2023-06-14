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
    
    private var matchView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBackgroundView
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
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
        //        label.text = "186"
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
        //        label.text = "73"
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var homeTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        //        label.text = "Barcelona"
        return label
    }()
    
    private lazy var awayTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        //        label.text = "Munchester United"
        return label
    }()
    
    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        //        label.text = "12-10-2023 14:00"
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
        contentView.addSubviews(view: [matchView, matchInfoLabel, matchInfoDevider, oddsInfoLabel, oddsDevider, homeAwayOddslabel, homeOdds, awayOdds, matchCountry, matchLeague, matchDateInfo, seasonDate, headToHeadInfo, headToHeadDevider])
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
            if UIScreen.main.bounds.height < 800 {
                make.height.equalTo(view.frame.height + 150)
            } else if UIScreen.main.bounds.height > 800 && UIScreen.main.bounds.height <= 813 {
                make.height.equalTo(view.frame.height + 50)
            } else {
                make.height.equalTo(830)
                scrollView.isScrollEnabled = true
            }
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
    }
}

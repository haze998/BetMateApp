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
        label.text = "186"
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
        label.text = "73"
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var homeTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        label.text = "Barcelona"
        return label
    }()
    
    private lazy var awayTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.textColor = .labelColor
        label.text = "Munchester United"
        return label
    }()

    private lazy var matchDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 20)
        label.text = "12-10-2023 14:00"
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
    private let leagueType = InfoLabel(labelType: .leagueType)
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
        contentView.addSubviews(view: [matchView, matchInfoLabel, matchInfoDevider, oddsInfoLabel, oddsDevider, homeAwayOddslabel, homeOdds, awayOdds, matchCountry, matchLeague, leagueType, matchDateInfo, seasonDate, headToHeadInfo, headToHeadDevider])
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
            make.left.equalTo(40)
        }
        
        matchLeague.snp.makeConstraints { make in
            make.top.equalTo(matchCountry.snp_bottomMargin).offset(20)
            make.left.equalTo(40)
        }
        
        leagueType.snp.makeConstraints { make in
            make.top.equalTo(matchLeague.snp_bottomMargin).offset(20)
            make.left.equalTo(40)
        }
        
        matchDateInfo.snp.makeConstraints { make in
            make.top.equalTo(leagueType.snp_bottomMargin).offset(20)
            make.left.equalTo(40)
        }
        
        seasonDate.snp.makeConstraints { make in
            make.top.equalTo(matchDateInfo.snp_bottomMargin).offset(20)
            make.left.equalTo(40)
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

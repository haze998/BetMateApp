//
//  GamesTableViewCell.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 21.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class GamesTableViewCell: UITableViewCell {

    // MARK: - Views
    private lazy var bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightBackgroundView
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//        label.text = "18:30, 15 August"
        return label
    }()
    
    private lazy var leftTeamLogo: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "footballteam1")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var versusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
        label.text = "VS"
        label.textColor = .labelColor
        return label
    }()

    private lazy var rightTeamLogo: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "footballteam2")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var leftTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var rightTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var leftGoalsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderViewColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var rightGoalsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderViewColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var leftTeamGoals: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 12)
        label.textColor = .labelColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rightTeamGoals: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 12)
        label.textColor = .labelColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var colonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
        label.text = ":"
        label.textColor = .labelColor
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // spacing between cells
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 35, right: 0))
        backgroundColor = .clear
    }
    
    // MARK: - Configure sports cell
    func configureFootballCell(with footballResponse: FootballResponse) {
        dateLabel.text = footballResponse.fixture.date.formatDateString(footballResponse.fixture.date)
        let homeImgURL = URL(string: footballResponse.teams.home.logo)
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: footballResponse.teams.away.logo)
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = footballResponse.teams.home.name
        rightTeamName.text = footballResponse.teams.away.name
        
        if ((footballResponse.goals.home) == nil) {
            leftTeamGoals.text = "not started"
        } else {
            leftTeamGoals.text = "\(footballResponse.goals.home ?? 0)"
        }
        
        if ((footballResponse.goals.away) == nil) {
            rightTeamGoals.text = "not started"
        } else {
            rightTeamGoals.text = "\(footballResponse.goals.away ?? 0)"
        }
    }
    
    func configureBaseballCell(with baseballResponse: BaseballResponse) {
        dateLabel.text = baseballResponse.date?.formatDateString(baseballResponse.date ?? "")
        let homeImgURL = URL(string: baseballResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: baseballResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = baseballResponse.teams?.home?.name
        rightTeamName.text = baseballResponse.teams?.away?.name
        leftTeamGoals.text = "\(baseballResponse.scores?.home?.total ?? 0)"
        leftTeamGoals.text = "\(baseballResponse.scores?.away?.total ?? 0)"
    }
    
    func configureBasketballCell(with basketballResponse: BasketballResponse) {
        dateLabel.text = basketballResponse.date?.formatDateString(basketballResponse.date ?? "")
        let homeImgURL = URL(string: basketballResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: basketballResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = basketballResponse.teams?.home?.name
        rightTeamName.text = basketballResponse.teams?.away?.name
    }
    
    func configureHockeyCell(with hockeyResponse: HockeyResponse) {
        dateLabel.text = hockeyResponse.date?.formatDateString(hockeyResponse.date ?? "")
        let homeImgURL = URL(string: hockeyResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: hockeyResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = hockeyResponse.teams?.home?.name
        rightTeamName.text = hockeyResponse.teams?.away?.name

    }
    
    func configureVolleyballCell(with volleyballResponse: VolleyballResponse) {
        dateLabel.text = volleyballResponse.date?.formatDateString(volleyballResponse.date ?? "")
        let homeImgURL = URL(string: volleyballResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: volleyballResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = volleyballResponse.teams?.home?.name
        rightTeamName.text = volleyballResponse.teams?.away?.name
    }
    
    func configureHandballCell(with handballResponse: HandballResponse) {
        dateLabel.text = handballResponse.date?.formatDateString(handballResponse.date ?? "")
        let homeImgURL = URL(string: handballResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: handballResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = handballResponse.teams?.home?.name
        rightTeamName.text = handballResponse.teams?.away?.name
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        contentView.addSubview(bgView)
        bgView.addSubviews(view: [dateLabel, leftTeamLogo, versusLabel, rightTeamLogo, leftTeamName, rightTeamName, leftGoalsView, rightGoalsView, leftTeamGoals, rightTeamGoals, colonLabel])
        leftGoalsView.addSubview(leftTeamGoals)
        rightGoalsView.addSubview(rightTeamGoals)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(17)
            make.centerX.equalToSuperview()
        }
        
        versusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(46)
        }
        
        leftTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(85)
            make.left.equalTo(44)
            make.top.equalTo(dateLabel.snp.bottom).offset(29)
        }
        
        rightTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(85)
            make.right.equalToSuperview().inset(44)
            make.top.equalTo(dateLabel.snp.bottom).offset(29)
        }
        
        leftTeamName.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.centerX.equalTo(leftTeamLogo)
            make.top.equalTo(leftTeamLogo.snp.bottom).offset(20)
        }
        
        rightTeamName.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.centerX.equalTo(rightTeamLogo)
            make.top.equalTo(rightTeamLogo.snp.bottom).offset(20)
        }
        
        leftGoalsView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(leftTeamName.snp.bottom).offset(21)
            make.centerX.equalTo(leftTeamName)
        }
        
        rightGoalsView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(rightTeamName.snp.bottom).offset(21)
            make.centerX.equalTo(rightTeamName)
        }
        
        leftTeamGoals.snp.makeConstraints { make in
            make.centerX.edges.equalTo(leftGoalsView)
        }
        
        rightTeamGoals.snp.makeConstraints { make in
            make.centerX.edges.equalTo(rightGoalsView)
        }
        
        colonLabel.snp.makeConstraints { make in
            make.top.equalTo(versusLabel.snp_bottomMargin).offset(110)
            make.centerX.equalTo(versusLabel)
        }
    }
}

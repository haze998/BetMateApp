//
//  FootballTableViewCell.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 21.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class FootballTableViewCell: UITableViewCell {

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
//        label.text = "Chelsea"
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var rightTeamName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
//        label.text = "Manutd"
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var leftOddsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderViewColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var rightOddsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.borderViewColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var leftTeamOdds: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 12)
        label.textColor = .labelColor
        label.textAlignment = .center
        label.text = "TODO"
        return label
    }()
    
    private lazy var rightTeamOdds: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 12)
        label.textColor = .labelColor
        label.textAlignment = .center
        label.text = "TODO"
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
    
    // MARK: - Configure cell
    func configureCell(with footballResponse: FootballResponse) {
        dateLabel.text = footballResponse.fixture?.date
        let homeImgURL = URL(string: footballResponse.teams?.home?.logo ?? "")
        leftTeamLogo.sd_setImage(with: homeImgURL)
        let awayImgURL = URL(string: footballResponse.teams?.away?.logo ?? "")
        rightTeamLogo.sd_setImage(with: awayImgURL)
        leftTeamName.text = footballResponse.teams?.home?.name
        rightTeamName.text = footballResponse.teams?.away?.name
        
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        contentView.addSubview(bgView)
        bgView.addSubviews(view: [dateLabel, leftTeamLogo, versusLabel, rightTeamLogo, leftTeamName, rightTeamName, leftOddsView, rightOddsView, leftTeamOdds, rightTeamOdds])
        leftOddsView.addSubview(leftTeamOdds)
        rightOddsView.addSubview(rightTeamOdds)
        
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
            make.height.width.equalTo(58)
            make.left.equalTo(52)
            make.top.equalTo(dateLabel.snp.bottom).offset(29)
        }
        
        rightTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(58)
            make.left.equalTo(versusLabel.snp.right).offset(52)
            make.top.equalTo(dateLabel.snp.bottom).offset(29)
        }
        
        leftTeamName.snp.makeConstraints { make in
            make.centerX.equalTo(leftTeamLogo)
            make.top.equalTo(leftTeamLogo.snp.bottom).offset(19)
        }
        
        rightTeamName.snp.makeConstraints { make in
            make.centerX.equalTo(rightTeamLogo)
            make.top.equalTo(leftTeamLogo.snp.bottom).offset(19)
        }
        
        leftOddsView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(leftTeamName.snp.bottom).offset(21)
            make.centerX.equalTo(leftTeamName)
        }
        
        rightOddsView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(rightTeamName.snp.bottom).offset(21)
            make.centerX.equalTo(rightTeamName)
        }
        
        leftTeamOdds.snp.makeConstraints { make in
            make.centerX.edges.equalTo(leftOddsView)
        }
        
        rightTeamOdds.snp.makeConstraints { make in
            make.centerX.edges.equalTo(rightOddsView)
        }
    }
}

//
//  DetailGamesCell.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 15.06.2023.
//

import UIKit
import SnapKit
import SDWebImage

class DetailGamesCell: UITableViewCell {

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
        label.textAlignment = .center
        return label
    }()
    
    private lazy var leftTeamLogo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var rightTeamLogo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 20)
//        label.text = "VS"
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
    
    func configureCell(with hthFootball: HeadToHeadFootballResponse) {
        guard let homeImgURL = URL(string: hthFootball.teams?.home?.logo ?? "") else { return }
        guard let awayImgURL = URL(string: hthFootball.teams?.away?.logo ?? "") else { return }
        leftTeamLogo.sd_setImage(with: homeImgURL)
        rightTeamLogo.sd_setImage(with: awayImgURL)
        scoreLabel.text = "\(hthFootball.goals?.home ?? 0)" + " " + ":" + " " + "\(hthFootball.goals?.away ?? 0)"
        dateLabel.text = hthFootball.fixture?.date?.formatDateString(hthFootball.fixture?.date ?? "")
    }
    
    private func setupLayout() {
        contentView.addSubview(bgView)
        bgView.addSubviews(view: [dateLabel, leftTeamLogo, rightTeamLogo, scoreLabel])
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(17)
            make.centerX.equalTo(bgView)
        }
        
        leftTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.left.equalTo(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }

        rightTeamLogo.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }

        scoreLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(40)
        }
    }
}

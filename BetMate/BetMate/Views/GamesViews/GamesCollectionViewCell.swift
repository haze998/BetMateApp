//
//  GamesCollectionViewCell.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import UIKit
import SnapKit

class SportsCollectionViewCell: UICollectionViewCell {
   
    // MARK: - Private views
    private lazy var sportsImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 14)
        label.textColor = .labelColor
        return label
    }()
        
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        backgroundColor = .lightBackgroundView
        layer.cornerRadius = 10
    }
    
    // MARK: - Setup cell
    func configureCell(with sport: GamesViewModel) {
        sportsImage.image = sport.icon
        sportsLabel.text = sport.name
    }
 
    // MARK: - Setup layout
    private func setupConstraints() {
        contentView.addSubviews(view: [sportsImage, sportsLabel])
        
        sportsImage.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(5)
        }
        
        sportsLabel.snp.makeConstraints { make in
            make.top.equalTo(sportsImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}

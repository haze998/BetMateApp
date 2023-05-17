//
//  NewsTableViewCell.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 17.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    // MARK: Views
    private lazy var bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightBackgroundView
        return view
    }()
    
    private lazy var logoNews: UIImageView = {
        let image = UIImageView(image: UIImage(named: "flame"))
        return image
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 12)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .loginButtonColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var newsContent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 14)
        label.textColor = .labelColor
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var postDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 12)
        label.textColor = UIColor(red: 0.114, green: 0.208, blue: 0.341, alpha: 0.5)
        return label
    }()
    
    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let targetSize = CGSize(width: 200, height: 200)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(bgView)
        bgView.addSubviews(view: [logoNews, newsTitle, deviderView, newsContent, postDate, postImage])
        bgView.addSubview(logoNews)
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        // spacing between cells
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0))
        backgroundColor = .clear
    }
    
    // MARK: - Configure cell
    func configureCell(with newsArticle: NewsArticle) {
        newsTitle.text = newsArticle.title
        newsContent.text = newsArticle.content
        postDate.text = newsArticle.publishedAt
        let imageURL = URL(string: newsArticle.urlToImage ?? "")
//        postImage.sd_setImage(with: imageURL)
        postImage.sd_setImage(with: imageURL, completed: { (image, error, cacheType, url) in
            if let image = image {
                SDImageCache.shared.clearMemory()
                SDImageCache.shared.clearDisk(onCompletion: nil)
                let resizedImage = image.sd_resizedImage(with: self.targetSize, scaleMode: .fill)
                self.postImage.image = resizedImage
            }
        })
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        logoNews.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.top.equalTo(bgView).inset(6)
            make.left.equalTo(bgView).inset(4)
        }

        newsTitle.snp.makeConstraints { make in
            make.left.equalTo(logoNews.snp.right).offset(12)
            make.top.equalTo(10)
            make.width.equalTo(300)
        }

        deviderView.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.centerX.equalToSuperview()
            make.top.equalTo(logoNews.snp.bottom).offset(6)
            make.height.equalTo(3)
        }
        
        newsContent.snp.makeConstraints { make in
            make.top.equalTo(deviderView.snp.bottom).offset(8)
            make.width.equalTo(320)
            make.left.equalTo(8)
        }

        postDate.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(300)
            make.top.equalTo(newsContent.snp.bottom).offset(1)
        }

        postImage.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(164)
            make.leading.trailing.top.bottom.equalTo(8)
        }
    }
}

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
        let image = UIImageView(image: UIImage(named: "sportnews"))
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
        label.text = "02/22/2023"
        return label
    }()
    
    private lazy var postImageContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
        
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        // spacing between cells
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0))
        backgroundColor = .clear
    }
    
    // MARK: - Configure cell
    func configureCell(with newsArticle: NewsArticle) {
        if ((newsArticle.title?.isEmpty) == nil) {
            newsTitle.text = "(Error downloading news title)"
        } else {
            newsTitle.text = newsArticle.title
        }
        
        if ((newsArticle.content?.isEmpty) == nil) {
            newsContent.text = "(Error downloading news content)"
        } else {
            newsContent.text = newsArticle.content
        }
        
        let imageURL = URL(string: newsArticle.urlToImage ?? "")
        if imageURL != nil {
            postImage.sd_setImage(with: imageURL)
        } else {
            postImage.image = UIImage(named: "image_placeholder")
        }
        
        postDate.text = newsArticle.publishedAt?.formatDateString(newsArticle.publishedAt ?? "")
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        contentView.addSubview(bgView)
        bgView.addSubviews(view: [logoNews, newsTitle, deviderView, newsContent, postDate, postImageContainer, postImage])
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        logoNews.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.top.equalTo(4)
            make.left.equalTo(8)
        }
        
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.left.equalTo(logoNews.snp.right).offset(6)
            make.width.equalTo(300)
        }
        
        deviderView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(logoNews.snp.bottom).offset(4)
            make.height.equalTo(3)
            make.leading.trailing.equalTo(contentView).inset(8)
        }
        
        newsContent.snp.makeConstraints { make in
            make.top.equalTo(deviderView.snp.bottom).offset(8)
            make.width.equalTo(300)
            make.left.equalTo(8)
        }
        
        postDate.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(200)
            make.top.equalTo(newsContent.snp.bottom).offset(1)
        }
        
        postImageContainer.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.trailing.bottom.equalTo(contentView).inset(8)
            make.top.equalTo(postDate.snp.bottom).offset(2)
        }
        
        postImage.snp.makeConstraints { make in
            make.center.edges.equalTo(postImageContainer)
        }
    }
}

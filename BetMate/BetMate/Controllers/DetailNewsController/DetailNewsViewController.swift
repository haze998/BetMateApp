//
//  DetailNewsViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 30.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class DetailNewsViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
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
    
    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemIndigo
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
//        label.text = "No, staring at a screen won’t damage your eyes"
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 24)
        label.numberOfLines = 3
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var authorImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sportnews")
        image.layer.cornerRadius = 15
        return image
    }()
    
    private lazy var auhtorName: UILabel = {
        let label = UILabel()
//        label.text = "Author Name"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 14)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var postDate: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//        label.text = "2023/13/03 14:00"
        return label
    }()
    
    private lazy var deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.25, alpha: 1.00)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView()
        view.font = UIFont(name: FontNames.exoMedium.rawValue, size: 17)
        view.backgroundColor = .clear
        view.textColor = .labelColor
//        view.sizeToFit()
        view.isScrollEnabled = false
        view.delegate = self
        return view
    }()
    
    var selectedNews: NewsArticle?
    
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
        guard let newsInfo = selectedNews else { return }
        let ImgURL = URL(string: newsInfo.urlToImage ?? "")
        newsImageView.sd_setImage(with: ImgURL)
        newsTitle.text = newsInfo.title
        auhtorName.text = newsInfo.author
        postDate.text = newsInfo.publishedAt?.formatDateString(newsInfo.publishedAt ?? "")
        textView.text = newsInfo.content
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(view: [newsImageView, newsTitle, authorImageView, auhtorName, postDate, deviderView, textView])
        
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
                make.height.equalTo(1260)
                scrollView.isScrollEnabled = true
            }
        }
        
        newsImageView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.width.equalToSuperview()
            make.top.left.trailing.equalToSuperview()
        }
        
        newsTitle.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        authorImageView.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalTo(newsTitle.snp_bottomMargin).offset(16)
            make.left.equalTo(16)
        }
        
        auhtorName.snp.makeConstraints { make in
            make.left.equalTo(authorImageView.snp_rightMargin).offset(16)
            make.top.equalTo(newsTitle.snp_bottomMargin).offset(22)
        }
        
        postDate.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(newsTitle.snp_bottomMargin).offset(22)
        }
        
        deviderView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.top.equalTo(authorImageView.snp_bottomMargin).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(deviderView.snp_bottomMargin).offset(16)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.height.equalToSuperview()

        }
    }
}

extension DetailNewsViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.size.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        guard textView.contentSize.height < 100.0 else { textView.isScrollEnabled = true; return }
        
        textView.isScrollEnabled = false
        textView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

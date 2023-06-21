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
    
    var viewModel: DetailNewsViewModel
    
    init(viewModel: DetailNewsViewModel) {
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
    
    private lazy var newsImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemIndigo
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 24)
        label.numberOfLines = 3
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var authorImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageNames.sportNews.rawValue)
        image.layer.cornerRadius = 15
        return image
    }()
    
    private lazy var auhtorName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var postDate: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    private lazy var deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.25, alpha: 1.00)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 19)
        label.textColor = .labelColor
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView()
        view.font = UIFont(name: FontNames.exoMedium.rawValue, size: 17)
        view.backgroundColor = .clear
        view.textColor = .labelColor
        view.isScrollEnabled = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var linkLabel: UILabel = {
        let label = UILabel()
        label.text = "URL :"
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 17)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var linkUrlLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 17)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.text = "Source :"
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 17)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var sourceNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoBold.rawValue, size: 17)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: ImageNames.backArrow.rawValue), for: .normal)
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .loginButtonColor
        button.layer.shadowColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1).cgColor
        button.layer.shadowRadius = 20
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        return button
    }()
    
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
        let newsInfo = viewModel.news
        let ImgURL = URL(string: newsInfo.urlToImage ?? "")
        newsImageView.sd_setImage(with: ImgURL)
        newsTitle.text = newsInfo.title
        auhtorName.text = newsInfo.author
        postDate.text = newsInfo.publishedAt?.formatDateString(newsInfo.publishedAt ?? "")
        textView.text = newsInfo.content
        descriptionLabel.text = newsInfo.description
        sourceNameLabel.text = newsInfo.source?.name
        
        let attributedText = NSAttributedString(string: newsInfo.url ?? "", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        linkUrlLabel.attributedText = attributedText
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(linkUrlLabelDidTap))
        linkUrlLabel.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Selectors
    @objc
    private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func linkUrlLabelDidTap() {
        if let url = URL(string: linkUrlLabel.text ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Setup layout
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(view: [newsImageView, newsTitle, authorImageView, auhtorName, postDate, deviderView, textView, backButton, descriptionLabel, linkLabel, linkUrlLabel, sourceLabel, sourceNameLabel])
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-40)
            make.left.right.bottom.equalToSuperview()
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
            make.width.equalTo(200)
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
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(deviderView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp_bottomMargin).offset(16)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(130)
        }
        
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalTo(newsImageView.snp_bottomMargin).inset(20)
            make.left.equalTo(16)
        }
        
        linkLabel.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.left.equalTo(16)
        }
        
        linkUrlLabel.snp.makeConstraints { make in
            make.left.equalTo(linkLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(textView.snp.bottom).offset(10)
        }
        
        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(linkLabel.snp.bottom).offset(16)
            make.left.equalTo(16)
        }
        
        sourceNameLabel.snp.makeConstraints { make in
            make.left.equalTo(sourceLabel.snp_rightMargin).offset(16)
            make.top.equalTo(linkLabel.snp.bottom).offset(16)
        }
    }
}


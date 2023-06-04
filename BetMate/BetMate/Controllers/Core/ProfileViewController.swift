//
//  ProfileViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 16.05.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image_placeholder")
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var userIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 16)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .labelColor
        return view
    }()
    
    private lazy var userInfoLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "personalInfo")
        return image
    }()
    
    private lazy var personalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal Info :"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 18)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var personalInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBackgroundView
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var nameInfo: UILabel = {
        let label = UILabel()
        label.text = "Name :"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 18)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 24)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var emailInfo: UILabel = {
        let label = UILabel()
        label.text = "User E-mail :"
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 18)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var emailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 24)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "logout"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.borderViewColor
        button.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addphoto"), for: .normal)
        button.addTarget(self, action: #selector(addPhotoButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private var nameImage: String = {
        var nameImage = ""
        return nameImage
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchingUser()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .background
    }
    
    // MARK: - Private func
    private func fetchingUser() {
        AuthNetworkManager.shared.fetchUserInfo { [weak self] user, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showFetchingUserAlert(on: self, with: error)
                return
            }
            
            if let user = user {
                userNameLabel.text = user.userName
                emailNameLabel.text = user.email
                userIdLabel.text = "ID : \(user.userUID)"
            }
        }
    }
    
    // MARK: - Selectors
    @objc
    private func logoutButtonDidTap() {
        AuthNetworkManager.shared.signOutUser { [weak self] wasLogout, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
            switch wasLogout {
            case true:
                viewModel.goToLogout()
            case false:
                return
            }
        }
    }
    
    @objc
    private func addPhotoButtonDidTap() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    // MARK: Setup layout
    private func setupLayout() {
        self.view.addSubviews(view: [avatarImageView, userIdLabel, deviderView, userInfoLogo, personalInfoLabel, personalInfoView, addPhotoButton])
        self.personalInfoView.addSubviews(view: [nameInfo, userNameLabel, emailInfo, emailNameLabel, logoutButton])
        
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        userIdLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.top.equalTo(avatarImageView.snp_bottomMargin).offset(16)
            make.centerX.equalToSuperview()
        }
        
        deviderView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(userIdLabel.snp_bottomMargin).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        userInfoLogo.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(deviderView.snp_bottomMargin).offset(40)
            make.left.equalTo(20)
        }
        
        personalInfoLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.left.equalTo(userInfoLogo.snp_rightMargin).offset(16)
            make.centerY.equalTo(userInfoLogo)
        }
        
        personalInfoView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.top.equalTo(userInfoLogo.snp_bottomMargin).offset(16)
            make.trailing.left.equalToSuperview().inset(20)
        }
        
        nameInfo.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameInfo.snp_bottomMargin).offset(10)
            make.centerX.equalToSuperview()
        }
        
        emailInfo.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
        }
        
        emailNameLabel.snp.makeConstraints { make in
            make.top.equalTo(emailInfo.snp_bottomMargin).offset(10)
            make.centerX.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(150)
            make.top.equalTo(emailNameLabel.snp_bottomMargin).offset(40)
            make.centerX.equalToSuperview()
        }
        
        addPhotoButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.left.equalTo(avatarImageView.snp_rightMargin).offset(0)
            make.centerY.equalTo(avatarImageView).offset(60)
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage {
            
            let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
            let imgName = imageURL?.lastPathComponent
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent(imgName!)
            let pngImage = image.jpegData(compressionQuality: 0.9)! as NSData
            do {
                try pngImage.write(to: fileURL, options: .atomic)
            } catch {
                print("error")
            }
            
            let filePath = documentsURL.appendingPathComponent(imgName!).path
            if FileManager.default.fileExists(atPath: filePath) {
                let new = UIImage(contentsOfFile: filePath)
                nameImage = imgName!
                avatarImageView.image = new
            }
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

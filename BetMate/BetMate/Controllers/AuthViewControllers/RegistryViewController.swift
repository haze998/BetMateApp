//
//  RegistryViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class RegistryViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var loginAccButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        button.setTitleColor(.labelColor, for: .normal)
        let attributedText = NSMutableAttributedString(string: "Do you already have an account? Login")
        attributedText.addAttribute(.foregroundColor, value: UIColor.loginButtonColor, range: NSRange(location: 32, length: 5))
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(loginAccButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let router: AuthRouter = Router.shared
    private let usernamtextField = CustomTextField(fieldType: .username)
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let eyeButton = EyeButton(frame: CGRect(x: 10, y: 0, width: 24, height: 24))
    private let customRegistryButton = CustomActionButton(actionButtonType: .registry)
    private var isPrivate = true

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupPasswordTF()
        addActions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        self.view.backgroundColor = .background
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "Create account"
    }
    
    private func setupPasswordTF() {
        passwordTextField.delegate = self
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
    }
    
    // MARK: - Actions
    private func addActions() {
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap), for: .touchUpInside)
        customRegistryButton.addTarget(self, action: #selector(registryButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func eyeButtonDidTap() {
        let imageName = isPrivate ? "eye" : "eye_slash"
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(named: imageName), for: .normal)
        isPrivate.toggle()
    }
    
    @objc
    private func registryButtonDidTap() {
        let registerUser = RegisterUserInfo(
            userName: usernamtextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? "")
        
        // check username
        if !Validator.isValidUserName(userName: registerUser.userName) {
            AlertManager.preventInvaliUserName(on: self)
            return
        }
        
        // check email
        if !Validator.isValidEmail(email: registerUser.email) {
            AlertManager.preventInvalidEmail(on: self)
            return
        }
        
         // check password
        if !Validator.isPasswordValid(for: registerUser.password) {
            AlertManager.preventInvalidPassword(on: self)
            return
        }
        
        AuthNetworkManager.shared.registerUser(with: registerUser) { [weak self] wasRegistered, error in
            guard let self = self else { return}
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
//            if wasRegistered {
//                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
//                    sceneDelegate.checkDefaultUserAuth()
//                }
//            }
            switch wasRegistered {
            case true:
                router.showNews(from: self)
            case false:
                return
            }
        }
    }
    
    @objc
    private func loginAccButtonDidTap() {
        router.showLogin(from: self)
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        view.addSubviews(view: [usernamtextField, emailTextField, passwordTextField, customRegistryButton, loginAccButton])
        
        usernamtextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(191)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(usernamtextField.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(emailTextField.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        customRegistryButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
        }
        
        loginAccButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.top.equalTo(customRegistryButton.snp.bottom).offset(24)
            make.centerX.equalTo(customRegistryButton)
        }
    }
}

extension RegistryViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
}


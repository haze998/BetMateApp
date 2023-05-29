//
//  LoginViewController.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 11.05.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var forgotPassButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password ?", for: .normal)
        button.setTitleColor(.labelColor, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.exoSemiBold.rawValue, size: 14)
        button.addTarget(self, action: #selector(forgotPassButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginWithLabel: UILabel = {
        let label = UILabel()
        label.text = "or login with"
        label.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        label.textColor = .labelColor
        return label
    }()
    
    private lazy var registerAccButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: FontNames.exoMedium.rawValue, size: 14)
        button.setTitleColor(.labelColor, for: .normal)
        let attributedText = NSMutableAttributedString(string: "Don't have an account yet? Register")
        attributedText.addAttribute(.foregroundColor, value: UIColor.loginButtonColor, range: NSRange(location: 27, length: 8))
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(registerAccButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordtextField = CustomTextField(fieldType: .password)
    private let eyeButton = EyeButton(frame: CGRect(x: 10, y: 0, width: 24, height: 24))
    private let customLoginButton = CustomActionButton(actionButtonType: .login)
    private let googleButton = CustomSocialsButton(typeOfSocials: .google)
    //    private let facebookButton = CustomSocialsButton(typeOfSocials: .facebook)
    //    private let appleButton = CustomSocialsButton(typeOfSocials: .apple)
    private var isPrivate = true
    var viewModel: LoginViewModel?
    
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
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.66, green: 0.85, blue: 0.86, alpha: 1.00)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.11, green: 0.21, blue: 0.34, alpha: 1.00),
            NSAttributedString.Key.font: UIFont(name: FontNames.exoSemiBold.rawValue, size: 42)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleTextAttr as [NSAttributedString.Key : Any]
        title = "Login"
    }
    
    private func setupPasswordTF() {
        passwordtextField.delegate = self
        passwordtextField.rightView = eyeButton
        passwordtextField.rightViewMode = .always
    }
    
    // MARK: - Actions
    private func addActions() {
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap), for: .touchUpInside)
        customLoginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonDidtap), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func eyeButtonDidTap() {
        let imageName = isPrivate ? "eye" : "eye_slash"
        passwordtextField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(named: imageName), for: .normal)
        isPrivate.toggle()
    }
    
    @objc
    private func forgotPassButtonDidTap() {
        viewModel?.goToForgotPass()
    }
    
    @objc
    private func googleButtonDidtap() {
        viewModel?.signInWithGoogle(viewController: self) { isLogin in
            switch isLogin {
            case true:
//                print()
//                let vc = TabBarViewController()
//                self.view.window?.rootViewController = vc
//                self.view.window?.makeKeyAndVisible()
//                self.navigationController?.setViewControllers([vc], animated: false)
                self.viewModel?.goToTabBar()
            case false:
                return
            }
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        let loginUser = SignInUserInfo(
            email: self.emailTextField.text ?? "",
            password: self.passwordtextField.text ?? ""
        )
        
        // Email check
        if !Validator.isValidEmail(email: loginUser.email){
            AlertManager.showSignInErrorAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: loginUser.password) {
            AlertManager.showSignInErrorAlert(on: self)
            return
        }
        
        AuthNetworkManager.shared.signInUser(with: loginUser) { [weak self] wasLogin, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            //            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            //                sceneDelegate.checkDefaultUserAuth()
            //            }
            switch wasLogin {
            case true:
                print()
//                let vc = TabBarViewController()
//                self.view.window?.rootViewController = vc
//                self.view.window?.makeKeyAndVisible()
//                self.viewModel?.goToTabBar()
            case false:
                return
            }
        }
    }
    
    @objc
    private func registerAccButtonDidTap() {
        viewModel?.goToRegistry()
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        self.view.addSubviews(view: [emailTextField, passwordtextField, forgotPassButton, customLoginButton, loginWithLabel, googleButton, registerAccButton])
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(191)
            make.centerX.equalToSuperview()
        }
        
        passwordtextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
            make.top.equalTo(emailTextField.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.width.equalTo(121)
            make.trailing.equalTo(passwordtextField)
            make.top.equalTo(passwordtextField.snp.bottom).offset(20)
        }
        
        customLoginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.top.equalTo(forgotPassButton.snp.bottom).offset(36)
        }
        
        loginWithLabel.snp.makeConstraints { make in
            make.width.equalTo(82)
            make.height.equalTo(19)
            make.top.equalTo(customLoginButton.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        
        googleButton.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(55)
            make.top.equalTo(loginWithLabel.snp.bottom).offset(24)
            make.centerX.equalTo(loginWithLabel)
        }
        
        registerAccButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.top.equalTo(googleButton.snp.bottom).offset(24)
            make.centerX.equalTo(googleButton)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
}

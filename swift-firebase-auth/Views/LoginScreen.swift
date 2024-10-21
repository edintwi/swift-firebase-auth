//
//  LoginScreen.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 14/10/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func didTapSignInButton(credentials: SignInUserRequest)
    func didTapSignUpButton()
    func didTapForgotPasswordButton()
}

class LoginScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setHierarchy()
        self.setupConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubview(self.loginTitle)
        self.addSubview(self.logo)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.signUpLabel)
        self.addSubview(self.recoveryPasswordButton)
     }
    
    weak var delegate: LoginScreenDelegate?
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Firebase Authentication"
        
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var logo : UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = false
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    } ()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor

        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    } ()
    
    private lazy var recoveryPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.addTarget(self, action: #selector(navigateToForgotPassword), for: .touchUpInside)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private lazy var signUpLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New User? Create Account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.addTarget(self, action: #selector(navigateToSignUP), for: .touchUpInside)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    } ()
    
    @objc private func didButtonTapped() {
        let userCredentials = SignInUserRequest(email: loginTextField.text!, password: passwordTextField.text!)
        delegate?.didTapSignInButton(credentials: userCredentials )
    }
    
    @objc private func navigateToSignUP() {
        delegate?.didTapSignUpButton()
    }
    
    @objc private func navigateToForgotPassword() {
        delegate?.didTapForgotPasswordButton()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.logo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            self.logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logo.widthAnchor.constraint(equalToConstant: 106),
            self.logo.heightAnchor.constraint(equalToConstant: 106),

            self.loginTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            
            self.loginTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 30),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            self.signUpLabel.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 10),
            self.signUpLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.recoveryPasswordButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 5),
            self.recoveryPasswordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
           
        ])
    }
}

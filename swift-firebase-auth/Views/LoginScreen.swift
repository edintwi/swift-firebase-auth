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
    
    weak var delegate: LoginScreenDelegate?
    
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
        self.addSubview(self.contentStackView)
        self.recoveryPasswordContainer.addSubview(self.recoveryPasswordButton)
        
     }
    
    // - MARK: - Layout
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            loginTitle, logo, loginTextField, passwordTextField, recoveryPasswordContainer, loginButton, signUpLabel
        ])
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fillProportionally
        
        
        
        stack.setCustomSpacing(5, after: passwordTextField)
        stack.setCustomSpacing(15, after: loginButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    
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
    
    private lazy var recoveryPasswordContainer: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private lazy var recoveryPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.textAlignment = .right
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
    
    // MARK: - ACTIONS
    
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
    
    
    // - MARK: - CONSTRAINTS
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.contentStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),

            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            self.recoveryPasswordContainer.heightAnchor.constraint(equalToConstant: 30),
            self.recoveryPasswordButton.trailingAnchor.constraint(equalTo: self.recoveryPasswordContainer.trailingAnchor),

            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.signUpLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
}

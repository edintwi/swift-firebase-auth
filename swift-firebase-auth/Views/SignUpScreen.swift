//
//  SignUpScreen.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

protocol SignUpDelegate: AnyObject {
    func didTapSignUpButton(registerUserRequest: RegisterUserRequest)
}

class SignUpScreen: UIView {
    weak var delegate : SignUpDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign Up"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Username"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.placeholder = "Username"
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
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "E-mail"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.placeholder = "E-mail"
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
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.autocorrectionType = .no
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    } ()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    @objc func signUpTapped() {
        let registerUserRequest = RegisterUserRequest(
            userName: userNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )

        delegate?.didTapSignUpButton(registerUserRequest: registerUserRequest)
    }
        
    private func setHierarchy() {
        self.addSubview(signUpLabel)
        self.addSubview(userNameLabel)
        self.addSubview(userNameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.signUpLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.signUpLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.userNameLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
            self.userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            self.userNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.userNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.emailLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            self.passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            
            self.signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.signUpButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        
            self.signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}

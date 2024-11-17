//
//  RecoveryPasswordView.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

protocol RecoveryPasswordScreenDelegate: AnyObject {
    func didTapSendMailButton(with email: String)
}

class RecoveryPasswordScreen: UIView {
    
    weak var delegate : RecoveryPasswordScreenDelegate?
    
    // - MARK: - Setup UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
       
    }
    
    private func setHierarchy() {
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(sendMailButton)
    }
    
    // - MARK: - UI Components
    private lazy var title: UILabel = {
        let label = UILabel()
        
        label.text = "Forgot password?"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Enter your email address \nto receive a link to reset your password."
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private lazy var sendMailButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Send Mail", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(sendMailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    // - MARK: - Selectors
    @objc private func sendMailTapped() {
        let email = self.emailTextField.text ?? ""
        delegate?.didTapSendMailButton(with: email)
    }
    
    // - MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 5),
            subTitle.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            sendMailButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sendMailButton.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            sendMailButton.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            sendMailButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
    }
}

//
//  HomeScreen.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 28/10/24.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func didTapLogoutButton()
}

class HomeScreen: UIView {
    
    weak var delegate: HomeScreenDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }  ()
    
    private lazy var userNameLabel: UILabel = {
        let label  = UILabel()
        label.text = "edintwi"
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var emailLabel: UILabel = {
        let label  = UILabel()
        label.text = "edintwi@gmail.com"
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
   @objc private func logoutTapped() {
        delegate?.didTapLogoutButton()
    }
    
    private func setupView(){
        self.backgroundColor = .white
        
        setHierarchy()
        setupConstraints()
    }
    
    private func setHierarchy(){
        self.addSubview(logoutButton)
        self.addSubview(userNameLabel)
        self.addSubview(emailLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            userNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

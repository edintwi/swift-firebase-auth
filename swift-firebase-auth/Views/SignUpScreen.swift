//
//  SignUpScreen.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 21/10/24.
//

import UIKit

class SignUpScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var SignUpLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign Up"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
        
    private func setHierarchy() {
        self.addSubview(SignUpLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            SignUpLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            SignUpLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

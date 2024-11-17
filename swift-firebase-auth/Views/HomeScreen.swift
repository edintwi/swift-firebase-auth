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
    
    // - MARK: Setup View
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    // - MARK: - UI Components
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }  ()
    
    public lazy var label: UILabel = {
        let label  = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()

    // - MARK: - Selectors
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
        self.addSubview(label)
    }
    
    // - MARK: - Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

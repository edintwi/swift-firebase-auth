//
//  HomeVC.swift
//  swift-firebase-auth
//
//  Created by Edson Brandon on 28/10/24.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var users = [User]()
    private var screen : HomeScreen!
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
        screen?.delegate = self
        
        screen?.tableView.delegate = self
        screen?.tableView.dataSource = self
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showUserFetchingError(on: self, with: error)
                return
            }
            
            if let user = user {
                screen.label.text = "\(user.username)\n\(user.email)"
                return
            }
        }
        
       
        
        Task {
            await fetchUsers()
            screen.tableView.reloadData()

        }
    }
    
    func fetchUsers() async {
        users = await AuthService.shared.fetcAllhUsers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = "\(users[indexPath.row].username)\n\(users[indexPath.row].email)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Users"
    }
    
    
}

extension HomeVC: HomeScreenDelegate {
    func didTapLogoutButton() {
        AuthService.shared.signOutUser { [weak self] error in
            guard let self = self else {return}
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?
                SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}

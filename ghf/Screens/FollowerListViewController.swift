//
//  FollowerListViewController.swift
//  ghf
//
//  Created by toscano on 2/16/21.
//

import UIKit

class FollowerListViewController: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
                case .success(let followers):
                    print("total de seguidores= \(followers.count)" )
                    print(followers)
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Ooops something wrong happen", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

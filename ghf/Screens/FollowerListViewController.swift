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
        //navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Ooops something wrong happen", message: errorMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            
            print("total de seguidores= \(followers.count)" )
            print(followers)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

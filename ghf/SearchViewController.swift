//
//  SearchViewController.swift
//  ghf
//
//  Created by toscano on 2/15/21.
//

import UIKit

class SearchViewController: UIViewController {

    let imgLogo = UIImageView()
    let formUserName = GFTextField()
    let btDoSearch = GFButton(bgColor: .systemGreen, title: "Get Follwers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureImgLogo()
        configureFormUserName()
        configureBtDoSearch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    func configureImgLogo(){
        view.addSubview(imgLogo)
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            imgLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            imgLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgLogo.heightAnchor.constraint(equalToConstant: 200),
            imgLogo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureFormUserName(){
        view.addSubview(formUserName)
        
        NSLayoutConstraint.activate([
            formUserName.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 48),
            formUserName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            formUserName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            formUserName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func configureBtDoSearch(){
        view.addSubview(btDoSearch)
        
        NSLayoutConstraint.activate([
            btDoSearch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            btDoSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            btDoSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            btDoSearch.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

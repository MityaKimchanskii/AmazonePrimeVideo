//
//  ViewController.swift
//  AmazonePrimeVideo
//
//  Created by Mitya Kim on 9/1/22.
//

import UIKit

class HomeViewController: AmazonPrimeVideoViewController {
    
    let headerView = HeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = UIColor(named: "backgroundColor")
        style()
        layout()
    }
    
    override func commonInit() {
        setTabBarImageFromAsset(imageName: "home", title: "Home")
    }
}

extension HomeViewController {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
}


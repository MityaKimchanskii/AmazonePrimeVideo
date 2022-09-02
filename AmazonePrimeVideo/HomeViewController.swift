//
//  ViewController.swift
//  AmazonePrimeVideo
//
//  Created by Mitya Kim on 9/1/22.
//

import UIKit

class HomeViewController: AmazonPrimeVideoViewController {
    
    let headerView = HeaderView()
    let menuBar = MenuBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = UIColor(named: "backgroundColor")
        menuBar.delegate = self
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
        menuBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(menuBar)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 35),
            
            menuBar.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}

extension HomeViewController: MenuBarDelegate {
    func didSelectItemAt(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
//        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
    }
}



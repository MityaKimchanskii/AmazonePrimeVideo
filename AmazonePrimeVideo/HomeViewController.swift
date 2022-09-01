//
//  ViewController.swift
//  AmazonePrimeVideo
//
//  Created by Mitya Kim on 9/1/22.
//

import UIKit

class HomeViewController: AmazonPrimeVideoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    override func commonInit() {
        setTabBarImageFromAsset(imageName: "home", title: "Home")
    }
}


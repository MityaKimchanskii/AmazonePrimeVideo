//
//  MenuBar.swift
//  AmazonePrimeVideo
//
//  Created by Mitya Kim on 9/1/22.
//

import Foundation
import UIKit

protocol MenuBarDelegate: AnyObject {
    func didSelectItemAt(index: Int)
}

class MenuBarView: UIView {
    
    let homeButton: UIButton!
    let originalsButton: UIButton!
    let tvButton: UIButton!
    let moviesButton: UIButton!
    let kidsButton: UIButton!
    let buttons: [UIButton]!
    
    let indicator = UIView()
    var indicatorLeading: NSLayoutConstraint?
    var indicatorTrailing: NSLayoutConstraint?
    let buttonSpace: CGFloat = 16
    
    weak var delegate: MenuBarDelegate?
    
    override init(frame: CGRect) {
        homeButton = makeButton(withText: "Home")
        originalsButton = makeButton(withText: "Originals")
        tvButton = makeButton(withText: "TV")
        moviesButton = makeButton(withText: "Movies")
        kidsButton = makeButton(withText: "Kids")
        
        buttons = [homeButton, originalsButton, tvButton, moviesButton, kidsButton]
        
        super.init(frame: .zero)
        
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .primaryActionTriggered)
        originalsButton.addTarget(self, action: #selector(originalsButtonTapped), for: .primaryActionTriggered)
        tvButton.addTarget(self, action: #selector(tvButtonTapped), for: .primaryActionTriggered)
        moviesButton.addTarget(self, action: #selector(moviesButtonTapped), for: .primaryActionTriggered)
        kidsButton.addTarget(self, action: #selector(kidsButtonTapped), for: .primaryActionTriggered)
        
        setAlpha(for: homeButton)
        
        styleIndicator()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleIndicator() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .white
    }
    
    private func layout() {
        addSubview(homeButton)
        addSubview(originalsButton)
        addSubview(tvButton)
        addSubview(moviesButton)
        addSubview(kidsButton)
        
        addSubview(indicator)
        
        let length = UIScreen.main.bounds.width - (homeButton.intrinsicContentSize.width +
                                                   originalsButton.intrinsicContentSize.width +
                                                   tvButton.intrinsicContentSize.width +
                                                   moviesButton.intrinsicContentSize.width +
                                                   kidsButton.intrinsicContentSize.width +
                                                   4*buttonSpace)
        let padding = length / 2
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: topAnchor),
            homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            
            originalsButton.topAnchor.constraint(equalTo: topAnchor),
            originalsButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor, constant: buttonSpace),
            
            tvButton.topAnchor.constraint(equalTo: topAnchor),
            tvButton.leadingAnchor.constraint(equalTo: originalsButton.trailingAnchor, constant: buttonSpace),
            
            moviesButton.topAnchor.constraint(equalTo: topAnchor),
            moviesButton.leadingAnchor.constraint(equalTo: tvButton.trailingAnchor, constant: buttonSpace),
            
            kidsButton.topAnchor.constraint(equalTo: topAnchor),
            kidsButton.leadingAnchor.constraint(equalTo: moviesButton.trailingAnchor, constant: buttonSpace),
            
            indicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        indicatorLeading = indicator.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor)
        indicatorTrailing = indicator.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor)
        
        indicatorLeading?.isActive = true
        indicatorTrailing?.isActive = true
    }
}

// MARK: - Actions
extension MenuBarView {
    @objc func homeButtonTapped() {
        delegate?.didSelectItemAt(index: 0)
        setAlpha(for: homeButton)
    
        indicatorLeading?.constant = 0
        indicatorTrailing?.constant = 0
    }
    
    @objc func originalsButtonTapped() {
        delegate?.didSelectItemAt(index: 1)
        setAlpha(for: originalsButton)
        
        indicatorLeading?.constant = homeButton.intrinsicContentSize.width + buttonSpace
        indicatorTrailing?.constant = originalsButton.intrinsicContentSize.width + buttonSpace
    }
    
    @objc func tvButtonTapped() {
        delegate?.didSelectItemAt(index: 2)
        setAlpha(for: tvButton)
        
        indicatorLeading?.constant = originalsButton.intrinsicContentSize.width
                                                    + 2*buttonSpace
                                                    + homeButton.intrinsicContentSize.width
        indicatorTrailing?.constant = originalsButton.intrinsicContentSize.width
                                                    + 2*buttonSpace
                                                    + tvButton.intrinsicContentSize.width
    }
    
    @objc func moviesButtonTapped() {
        delegate?.didSelectItemAt(index: 3)
        setAlpha(for: moviesButton)
    
        indicatorLeading?.constant = tvButton.intrinsicContentSize.width
                                                    + 3*buttonSpace
                                                    + homeButton.intrinsicContentSize.width
                                                    + originalsButton.intrinsicContentSize.width
        
        indicatorTrailing?.constant = originalsButton.intrinsicContentSize.width
                                                    + 3*buttonSpace
                                                    + tvButton.intrinsicContentSize.width
                                                    + moviesButton.intrinsicContentSize.width
    }
    
    @objc func kidsButtonTapped() {
        delegate?.didSelectItemAt(index: 4)
        setAlpha(for: kidsButton)
        
        indicatorLeading?.constant = originalsButton.intrinsicContentSize.width
                                                    + 4*buttonSpace
                                                    + tvButton.intrinsicContentSize.width
                                                    + moviesButton.intrinsicContentSize.width
                                                    + homeButton.intrinsicContentSize.width
        indicatorTrailing?.constant = originalsButton.intrinsicContentSize.width
                                                    + 4*buttonSpace
                                                    + tvButton.intrinsicContentSize.width
                                                    + moviesButton.intrinsicContentSize.width
                                                    + kidsButton.intrinsicContentSize.width
    }
}
 
extension MenuBarView {
    
    private func setAlpha(for button: UIButton) {
        homeButton.alpha = 0.5
        originalsButton.alpha = 0.5
        tvButton.alpha = 0.5
        moviesButton.alpha = 0.5
        kidsButton.alpha = 0.5
        
        button.alpha = 1.0
    }
}

extension MenuBarView {
    
    func selectItem(at index: Int) {
        animateIndecator(to: index)
    }
    
    private func animateIndecator(to index: Int) {
        
        var button: UIButton
        switch index {
        case 0:
            button = homeButton
        case 1:
            button = originalsButton
        case 2:
            button = tvButton
        case 3:
            button = moviesButton
        case 4:
            button = kidsButton
        default:
            button = homeButton
        }
        
        setAlpha(for: button)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

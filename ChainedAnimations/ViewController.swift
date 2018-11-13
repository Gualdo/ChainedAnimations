//
//  ViewController.swift
//  ChainedAnimations
//
//  Created by De La Cruz, Eduardo on 08/11/2018.
//  Copyright © 2018 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Setup UI
    let titlelabel = UILabel()
    let bodyLabel = UILabel()

    fileprivate func setupLabels() {
        
        titlelabel.numberOfLines = 0
        titlelabel.text = "Welcome to company XYZ"
        titlelabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Thans so much for downloading our brand new app and giving us a try. Make sure to leave us a good review in the AppStore"
    }
    
    fileprivate func setupStackView() {
        
        let stackView = UIStackView(arrangedSubviews: [titlelabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        // Enables autolayout
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupStackView()
        
        // Fun Animations
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }
    
    @objc fileprivate func handleTapAnimations() {
        print("Animating")
        
        // Title Label Animation
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titlelabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5 , delay: 0 , usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titlelabel.alpha = 0
                self.titlelabel.transform = self.titlelabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        // Body Label Animation
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5 , delay: 0 , usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
}

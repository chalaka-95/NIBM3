//
//  DashboardViewController.swift
//  NIBM3
//
//  Created by Chalaka Hasantha on 11/4/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    let logoImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.circle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let profileTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight:.bold)
        label.textAlignment = .left
        return label
    }()
    
    let profileDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    let viewHolderMain : UIStackView={
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let viewProfileHolder : UIStackView={
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        profileTitleLabel.text = "Ghulam"
        profileDescriptionLabel.text = "UX UI Designer"
        viewProfileHolder.insertArrangedSubview(logoImage, at: 0)
        viewProfileHolder.insertArrangedSubview(profileTitleLabel, at: 1)
        viewProfileHolder.insertArrangedSubview(profileDescriptionLabel, at: 2)
        viewHolderMain.insertArrangedSubview(viewProfileHolder, at: 0)
        view.addSubview(viewHolderMain)
        setupConstraint()
    }
    
    func setupConstraint(){
        
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive  = true
        //viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }
    
}

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
        let image = UIImageView(image: UIImage(named: "profile"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let corporateImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "profile"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        image.tintColor = .white
        return image
    }()
    
    let profileTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight:.bold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let profileDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let corporateAPPTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight:.bold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    let viewHolderMain : UIStackView={
        let stack = UIStackView()
        stack.axis = .vertical
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
    
    let viewListHolder : UIStackView={
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        profileTitleLabel.text = "Ghulam"
        profileDescriptionLabel.text = "UX UI Designer"
        viewProfileHolder.insertArrangedSubview(logoImage, at: 0)
        viewProfileHolder.insertArrangedSubview(profileTitleLabel, at: 1)
        viewProfileHolder.insertArrangedSubview(profileDescriptionLabel, at: 2)
        
        corporateAPPTitleLabel.text = "Corporate APP"
        viewListHolder.insertArrangedSubview(corporateImage, at: 0)
        viewListHolder.insertArrangedSubview(corporateAPPTitleLabel, at: 1)
        
        viewHolderMain.insertArrangedSubview(viewProfileHolder, at: 0)
        viewHolderMain.insertArrangedSubview(viewListHolder, at: 1)
        view.addSubview(viewHolderMain)
        setupConstraint()
    }
    
    func setupConstraint(){
        
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        corporateImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        corporateImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive  = true
        viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2).isActive = true
        
    }
    
}

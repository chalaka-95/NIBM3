//
//  ViewController.swift
//  NIBM3
//
//  Created by Chalaka Hasantha on 10/21/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let view1:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .green
//        return view
//    }()
    
    let logoImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight:.bold)
        label.textAlignment = .center
        return label
    }()
    
        let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight:.bold)
        label.textAlignment = .center
        return label
    }()
    
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight:.bold)
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    let viewHolderMain : UIStackView={
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
        let viewHolder : UIStackView={
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        //self.view.addSubview(view1)
        
//        //add to view
//        view.addSubview(logoImage)
//        view.addSubview(titleLabel)
        titleLabel.text = "iOS Development"
        descriptionLabel.text = "iOS Development Project Description"
        dateLabel.text = "2022/10/23"
//        viewHolder.insertArrangedSubview(titleLabel, at: 0)
//        viewHolder.insertArrangedSubview(descriptionLabel, at: 1)
//        viewHolder.insertArrangedSubview(dateLabel, at: 2)
        
        viewHolder.insertArrangedSubview(titleLabel, at: 0)
        viewHolder.insertArrangedSubview(descriptionLabel, at: 1)
        //viewHolder.insertArrangedSubview(dateLabel, at: 2)
        //view.addSubview(viewHolder)
        
        viewHolderMain.insertArrangedSubview(logoImage, at: 0)
        viewHolderMain.insertArrangedSubview(viewHolder, at: 1)
        view.addSubview(viewHolderMain)
        
        setupConstraint()
    }
    //set constraint manual
    func setupConstraint(){
        // view1.widthAnchor.constraint(equalToConstant: 200).isActive=true
        // view1.heightAnchor.constraint(equalToConstant: 100).isActive=true
        // view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        logoImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 120).isActive = true
//        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive  = true
//        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        logoImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
//        //logo eke bottom eka titlelabel eke top ekata set kara
//        titleLabel.topAnchor.constraint(equalTo:logoImage.bottomAnchor,constant: 20).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 40).isActive = true
        
//        //sefe area is must *
//        viewHolder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 2).isActive = true
//        viewHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive  = true
//        viewHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        logoImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        viewHolderMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 2).isActive = true
        viewHolderMain.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive  = true
        viewHolderMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
}


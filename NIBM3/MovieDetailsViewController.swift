//
//  MovieDetailsViewController.swift
//  NIBM_TEST
//
//  Created by Chalaka Hasantha on 11/12/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    var selectedMovie : Result?
    
    let poster : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
        }()
    
    let overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let releseDateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrait()
        loadContent()
    }
    
    
    func setupConstrait() {
        self.view.addSubview(poster)
        poster.snp.makeConstraints{
            make in
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview()
        }
        
        let holder = UIStackView(arrangedSubviews: [titleLabel,overviewLabel,overviewLabel])
        holder.spacing = 10
        holder.axis = .vertical
        self.view.addSubview(holder)
        
        holder.snp.makeConstraints{
            make in
            
            make.top.equalTo(poster.snp_bottomMargin).offset(40)
            make.leading.equalTo(view.snp_leadingMargin).offset(20)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
        }
    }
    
    
    func loadContent(){
        if let movie = selectedMovie {
            let imageLink = "https://image.tmdb.org/t/p/w185" + movie.posterPath
            if let imageURL = URL(string: imageLink){
                poster.kf.setImage(with: imageURL)
            }
            
            titleLabel.text = movie.title
            releseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
        }
    }
    

}

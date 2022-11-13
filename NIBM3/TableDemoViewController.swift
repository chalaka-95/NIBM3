//
//  TableDemoViewController.swift
//  NIBM_TEST
//
//  Created by Chalaka Hasantha on 11/12/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TableDemoViewController: UIViewController {
    
    let data = ["Apple","Google","Facebook","WhatsApp","Instergram","HP","Dell","Amazon"]
    
    var movies : [Result] = [Result]()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCellView.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        setupConstraint()
        downloadMovies()
    }
    
    func setupConstraint(){
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //API eke thiyana data API eken aran ena part eka
    func downloadMovies(){
        let url = URL(string: "https://api.themoviedb.org/4/list/3?page=1&api_key=f9923821f549f034afb399cd27e37afd")!
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url:url)){
            data, res, error in
            
//            print("response \(res)")
            
            if let movieData = data {
                let json = try? JSONDecoder().decode(MoviesModule.self, from: movieData)
//                print(json?.results)
                
                if let movies = json?.results {
                    self.movies = movies
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        dataTask.resume()
    }


}

extension TableDemoViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        //return data.count
        
        //movie row count eka
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        cell.textLabel?.text = "Cell ID"
        let cell : MyCellView = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! MyCellView
        
        //API eken ena data table ekata set laranne methamnin
        cell.titleLabel.text = self.movies[indexPath.row].originalTitle
        
        //API eke Movie walata adala image eka set karanne meken
        let imageURL = "https://image.tmdb.org/t/p/w185" + movies[indexPath.row].backdropPath
        
        if let url = URL(string: imageURL){
            cell.Myimage.kf.setImage(with: url)
        }
        
       // cell.Myimage.image = UIImage(named: "appleorigin")
        
        //cell.Myimage.image = UIImage(systemName: "highlighter")  sf symbol icon dana eka
        
//        cell.titleLabel.text = data[indexPath.row]
//        cell.descriptionlabel.text = "Description Label"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsViewController()
        vc.selectedMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}



//f8340096e2c083ab09163335f6f1ad70

class MyCellView : UITableViewCell{
    
    let Myimage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
        }()
    
    let descriptionlabel : UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 12, weight: .light)
        return description
    }()
    
    let baseView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.shadowRadius = 0.5
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowColor = UIColor.black.cgColor
        //view.layer.shadowOpacity = 0.2
        return view
    }()
    
    let labelHolder : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    let contentHolder : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(Myimage)
        setupConstraint()
        layComponent()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not be impemented")
    }
    
    func layComponent(){
        labelHolder.addArrangedSubview(titleLabel)
        labelHolder.addArrangedSubview(descriptionlabel)
        contentHolder.addArrangedSubview(Myimage)
        contentHolder.addArrangedSubview(labelHolder)
        baseView.addSubview(contentHolder)
        contentView.addSubview(baseView)
    }
    
    private func setupConstraint(){
        
//        baseView.snp.makeConstraints{
//            make in
//            make.leading.top.equalToSuperview().offset(20)
//            make.trailing.bottom.equalToSuperview().offset(-20)
//        }
        
//        Myimage.snp.makeConstraints{
//            make in
//            make.leading.top.equalToSuperview().offset(20)
//            make.trailing.bottom.equalToSuperview().offset(-20)
//        }
        
        Myimage.snp.makeConstraints{
            make in
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
}

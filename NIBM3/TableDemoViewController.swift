//
//  TableDemoViewController.swift
//  NIBM3
//
//  Created by Chalaka Hasantha on 10/22/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit
import SnapKit
class TableDemoViewController: UIViewController {
    
    let data = ["Apple", "Google", "Facebook", "HP"]
    
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
        setContraint()
        // Do any additional setup after loading the view.
    }
    
    func setContraint(){
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive  = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
                
    }

}

extension TableDemoViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //let cell = UITableViewCell(style: .subtitle,reuseIdentifier: "cell")
        let cell : MyCellView = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! MyCellView
        cell.myImage.image = UIImage(named: "logo")
        cell.titleLabel.text = data[indexPath.row]
        cell.descriptionLabel.text = "Description Label"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat{
        return 120
    }
}
class MyCellView : UITableViewCell{    
    
    let baseView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowRadius=0.5
        view.layer.shadowOffset = CGSize(width:10, height:10)
        view.layer.shadowColor = UIColor.black.cgColor
        return view
        
    }()
    
    let myImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelHolder : UIStackView={
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let contentHolder : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier:reuseIdentifier)
        self.contentView.addSubview(myImage)
        layComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implementd")
    }
    
    private func setupConstraint()
    {
        baseView.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
        myImage.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            
        }
    }
    
    func layComponent(){
        labelHolder.addArrangedSubview(titleLabel)
        labelHolder.addArrangedSubview(descriptionLabel)
        contentHolder.addArrangedSubview(myImage)
        contentHolder.addArrangedSubview(labelHolder)
        baseView.addSubview(contentHolder)
        contentView.addSubview(baseView)
    }
}

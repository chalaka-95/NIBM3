//
//  DetailsViewController.swift
//  NIBM3
//
//  Created by Chalaka Hasantha on 10/28/22.
//  Copyright © 2022 Chalaka Hasantha. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    let view1:UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(view1)
        setupConstraint()
    }
    
func setupConstraint(){
    view1.snp.makeConstraints{make in
        make.leading.equalTo(view.snp_leadingMargin).offset(20)
        make.trailing.equalTo(view.snp_trailingMargin).offset(-20)
        make.top.equalTo(view.snp_topMargin).offset(20)
        make.bottom.equalTo(view.snp_bottomMargin).offset(-20)
        
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  CustomControl
//
//  Created by ibrahim asiri on 13/06/1443 AH.
//

import UIKit

protocol SliderV{
     func valuChanged(value: Float)
 }

class ViewController: UIViewController, SliderV {
    
    var lable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lable)
        lable.text = "Hi"
        lable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
    
    func valuChanged(value: Float){
        lable.text = "\(value)"
    }
    
    
}


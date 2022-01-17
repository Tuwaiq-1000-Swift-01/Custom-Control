//
//  ViewController.swift
//  CustomControl
//
//  Created by ibrahim asiri on 13/06/1443 AH.
//

import UIKit

 

class ViewController: UIViewController{
    
    var lable = UILabel()
    var slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(slider)
        view.addSubview(lable)
        lable.text = "Hi"
        lable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        slider.addTarget(self, action: #selector(change), for: .touchUpInside)
    }
    
    @objc func change(_ sender: Slider!) {
        self.lable.text = sender.formatteValue(value: sender.value)
        print("done")

         }
    
    
}


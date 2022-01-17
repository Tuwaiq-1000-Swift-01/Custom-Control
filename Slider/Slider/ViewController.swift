//
//  ViewController.swift
//  Slider
//
//  Created by MAC on 13/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var valueLabel: UILabel!
        @IBOutlet weak var selidarView: Slider!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           selidarView.addTarget(self, action: #selector(ViewController.valueChange(_:)), for: .touchUpInside)
       }

       @objc func valueChange(_ sender:Any){
           valueLabel.text = String(format: "%.2f", selidarView.value)
       }

   }

//
//  ViewController.swift
//  CustomControls
//
//  Created by Majed Alshammari on 13/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var sliderView: Slider!
    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderView.addTarget(self, action: #selector(ViewController.valueChange(_:)), for: .touchUpInside)
    }

    @objc func valueChange(_ sender:Any){
        valueLabel.text = String(format: "%.2f", sliderView.value)
    }
    
}


//
//  ViewController.swift
//  Custom Control HW
//
//  Created by Abdullah Bajaman on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
//    func getValue(sliderVal: CGFloat) {
//        DispatchQueue.main.async {
//
//            self.slideValue.text = String(format: "%.2f", sliderVal)
//        }
//        self.sliderValue = String(format: "%.2f", sliderVal)
        
//    }
//    @IBOutlet weak var v: UIView!
    @IBOutlet weak var v: Slider!
    var sliderValue = ""
    @IBOutlet weak var slideValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onChangeVal(_ sender: Slider) {
        print(sender.value)
        slideValue.text = String(format: "%.2f", sender.value)
    }
    
}


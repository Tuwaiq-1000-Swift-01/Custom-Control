//
//  ViewController.swift
//  CustomControl
//
//  Created by A A on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
  
//  var slider: Slider?
  
  @IBOutlet weak var valueLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: Notification.Name.init(rawValue: "updateValue"), object: nil)
  }
  
  
  @objc func updateData(_ notification : NSNotification) {
    if let value = notification.userInfo?["value"] as? Float {
      valueLabel.text = String(format: "%.2f", value)
      
    }
  }
  
  
}


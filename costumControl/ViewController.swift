//
//  ViewController.swift
//  costumControl
//
//  Created by Afnan Theb on 13/06/1443 AH.
//

import UIKit

class ViewController: UIViewController  {
    
    var label = UILabel()
    @IBOutlet weak var mySlider: Slider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: view.frame.midX , y: view.frame.midY + 220)
        label.textAlignment = .center
        label.text = String(mySlider.value)
        self.view.addSubview(label)
      
        
       
       
    }
    @IBAction func slaiderAction(_ sender: Slider) {
        self.label.text = sender.formattedValue(value: sender.value)
        
    }
    
    
}


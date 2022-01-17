
//  ViewController.swift
//  MakeSlider
//
//  Created by Anas Hamad on 13/06/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    

    @IBOutlet var Label: UILabel!
    @IBOutlet var uiView: Slider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiView.addTarget(self, action: #selector(labelShow(_sender:)), for:.allTouchEvents)
        
        }
     
    @objc func labelShow(_sender: Any){
        
        Label.text = String(uiView.value)
        
        print(uiView.value)
        
    }
  
}






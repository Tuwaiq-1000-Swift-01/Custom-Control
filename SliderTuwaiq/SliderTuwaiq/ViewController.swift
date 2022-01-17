//
//  ViewController.swift
//  SliderTuwaiq
//
//  Created by Atheer Othman on 13/06/1443 AH.
//

import UIKit
protocol SliderValue{
    func sliderValuChanged(value: Float)
}
class ViewController: UIViewController , SliderValue{

    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var slider: Slider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        valueLabel.text = "Value Here"
    
    }
    
    func sliderValuChanged(value: Float){
        valueLabel.text = "\(value)"
    }
}


//
//  TheViewController.swift
//  MakeSlider
//
//  Created by Anas Hamad on 02/08/1443 AH.
//

import UIKit

class TheViewController: UIViewController {

    @IBOutlet var starttt: UIButton!
    @IBOutlet var pauseeee: UIButton!
    @IBOutlet var resum: UIButton!
    @IBOutlet var reset: UIButton!
    @IBOutlet var label: UILabel!
    
    @IBOutlet var clock: Third!
    var durationTimer :CFTimeInterval = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starttt.addTarget(self, action: #selector(startt), for: .touchUpInside)
        pauseeee.addTarget(self, action: #selector(pause), for: .touchUpInside)
        resum.addTarget(self, action: #selector(resume), for: .touchUpInside)
        reset.addTarget(self, action: #selector(reseet), for: .touchUpInside)
        
    }
    

    @objc func startt(){
        clock.start(duration: durationTimer)
        
    }
    @objc func pause(){
        clock.pause()
        
    }
    @objc func resume(){
        
        clock.resume()
    }
    @objc func reseet(){
        
        clock.reset()
    }
    
}

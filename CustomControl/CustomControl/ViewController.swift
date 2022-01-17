//
//  ViewController.swift
//  CustomControl
//
//  Created by HAJAR on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    func scoreSelected(_ id : Float) {
        //the touched point it will printed
        print("touched point \(id)")
        //but when i try with follwing code it crashe the app
        // i try also to make it in thread but also the same proplem
        
        //         self.firstLable.text = String(id)
        
        
    }
    
    
    @IBOutlet weak var firstLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register to receive notification in this class
        NotificationCenter.default.addObserver(self, selector: #selector(self.touchedPoint(_:)), name: NSNotification.Name(rawValue: "scoreSelected"), object: nil)
                                               
                                               }
    
       // handle notification
       @objc func touchedPoint(_ notification: NSNotification) {
            print(notification.userInfo ?? "")
            if let dict = notification.userInfo as NSDictionary? {
                if let id = dict["value"] as? Float{
                    self.firstLable.text = String(id)
                }
            }
        }
                                               
                                               
                                               
                                               
                                               }
                                               

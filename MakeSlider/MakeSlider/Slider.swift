//
//  Slider.swift
//  MakeSlider
//
//  Created by Anas Hamad on 13/06/1443 AH.
//

import Foundation
import UIKit
class Slider : UIControl{
    
    let shapLayer = CAShapeLayer()
   
    
    @IBInspectable var color : UIColor = #colorLiteral(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
   @IBInspectable var max:Float = 10
    @IBInspectable var min:Float = 0
     private (set) var value:Float = 0
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    func setup() {
        
        self.backgroundColor = .cyan
        self.layer.cornerRadius = 19
        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2,
                                  y: self.frame.height/2),
                 ofColor: #colorLiteral(red: 0.847, green: 0.847, blue: 0.847, alpha: 1))
        
    }
    
    private func drawLine(from start:CGPoint,toPoint end : CGPoint,ofColor color: UIColor){
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        shapLayer.path = path.cgPath
        shapLayer.strokeColor = #colorLiteral(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
        self.layer.addSublayer(shapLayer)
        shapLayer.lineWidth = 30
        shapLayer.cornerRadius = 30
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: self)
        
        if touchPoint.y < 0 || touchPoint.y > self.frame.height {
            return
            
        }
        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2,
                                  y: touchPoint.y),
                 ofColor: color )
        
        let diff = CGFloat(max - min)
        value = max - Float(touchPoint.y * diff / self.frame.height)
        
  }
}






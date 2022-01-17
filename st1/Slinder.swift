//
//  Slinder.swift
//  st1
//
//  Created by Amal on 13/06/1443 AH.
//

import Foundation
import UIKit

class Slinder: UIControl {
        
    let sheapLayer = CAShapeLayer()
    @IBInspectable var color:UIColor = UIColor.orange
    @IBInspectable var maximumValue : Float = 7
    @IBInspectable var minimumValue : Float = 1
    @IBInspectable var value : Float = 0
    
    let labelCounter: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .systemGray6
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
   private func setup() {
        self.backgroundColor = .systemGray6
       self.layer.cornerRadius = 16
       addSubview(labelCounter)
       
       NSLayoutConstraint.activate([
           labelCounter.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 40),
           labelCounter.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -40),
           labelCounter.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 100)
       ])
    }
    //اسلوب تسميه خاصه بالفنكشن
    private func drowLine(from start:CGPoint , toPoint end:CGPoint , ofColor color:UIColor) {
        let path =  UIBezierPath()
        
        path.move(to: start)
        path.addLine(to: end)
        sheapLayer.path = path.cgPath
        sheapLayer.strokeColor = #colorLiteral(red: 1, green: 0.5798009634, blue: 0.5368468165, alpha: 1)
        sheapLayer.lineWidth = 18
        labelCounter.text = String(format: "%.2f", value)
        self.layer.addSublayer(sheapLayer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: self)
        
        if touchPoint.y < 0 || touchPoint.y > self.frame.height {
            return
        }
        drowLine(
            from: CGPoint(x: self.frame.width/2,
                          y: self.frame.height),
         toPoint: CGPoint(x: self.frame.width/2,
                          y: touchPoint.y),
         ofColor: color)
        
        let diff = CGFloat(maximumValue - minimumValue)
        value = maximumValue - Float(touchPoint.y * diff / self.frame.height)
        print(value)
    }
}

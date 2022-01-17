//
//  Slider.swift
//  CustomControl
//
//  Created by Maram Al shahrani on 13/06/1443 AH.
//

import Foundation
import UIKit
class Slider: UIControl {
    let sheapLayer = CAShapeLayer()
    
    @IBInspectable var color:UIColor = #colorLiteral(red: 0.8193333745, green: 0.5149409771, blue: 0.2677208781, alpha: 1)
    @IBInspectable var maximumValue : Float = 7
    @IBInspectable var minimumValue : Float = 1
    @IBInspectable var value : Float = 0
    private var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.textColor     =  UIColor.black
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.text = ""
        return valueLabel
    }()

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    private func setup() {
        self.backgroundColor = .cyan
        self.layer.cornerRadius = 16
        self.addSubview(valueLabel)
        NSLayoutConstraint.activate([
            
            
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 100),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50),
        ])
    }
    
    private func drowLine(from start:CGPoint , toPoint end:CGPoint , ofColor color:UIColor) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end) // عطيته coordinate
        sheapLayer.path = path.cgPath
        sheapLayer.strokeColor = #colorLiteral(red: 0.8193333745, green: 0.5149409771, blue: 0.2677208781, alpha: 1)
        sheapLayer.lineWidth = 18
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
                          //.midX replace .width/2
                          y: self.frame.height),
            toPoint: CGPoint(x: self.frame.width/2,
                             y: touchPoint.y),
            ofColor: color)
        let diff = CGFloat(maximumValue - minimumValue)
        value = maximumValue - Float(touchPoint.y * diff / self.frame.height)
        valueLabel.text = "\(value)"
        valueLabel.text = String(format: "%.2f", value)
        print(value)
    }
}

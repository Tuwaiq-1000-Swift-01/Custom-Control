//
//  Slide.swift
//  CustomControls
//
//  Created by Majed Alshammari on 13/06/1443 AH.
//

import Foundation
import UIKit

class Slider:UIControl {
    let shapeLayer = CAShapeLayer()
    @IBInspectable var color: UIColor = #colorLiteral(red: 1, green: 0.1048450006, blue: 0.04792121553, alpha: 1)
    @IBInspectable var minValue: Float = 1
    @IBInspectable var maxValue: Float = 7
    @IBInspectable private(set) var value:Float = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup(){
        self.backgroundColor = .gray
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
        drawLine(from: CGPoint(x: self.frame.width/2,y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2,
                                  y: self.frame.height/2)
                 ,ofColor: color)
    }
    
    private func drawLine(from start: CGPoint,toPoint end: CGPoint,ofColor color:UIColor){
        let path = UIBezierPath()
        
        path.move(to: start)
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.1048450006, blue: 0.04792121553, alpha: 1)
        shapeLayer.lineWidth = 33
        self.layer.addSublayer(shapeLayer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: self)
        
        if touchPoint.y < 0 || touchPoint.y > self.frame.height{
            return
        }
        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2,
                                  y: touchPoint.y),
                 ofColor: color)
        let diff = CGFloat( maxValue - minValue)
        value = maxValue - Float(touchPoint.y * diff / self.frame.height)
    }
    
}

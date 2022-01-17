//
//  Slider.swift
//  Custom Control HW
//
//  Created by Abdullah Bajaman on 16/01/2022.
//

import UIKit
protocol Val {
    func getValue(sliderVal: CGFloat)
}
class Slider: UIControl{
    let shapeLayer = CAShapeLayer()
    var path = UIBezierPath()
    var delegate : Val?
    @IBInspectable var maximumValue: Float = 7
    @IBInspectable var minimumValue: Float = 1
    @IBInspectable var value: Float = 0
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
        
    }
    private func setup(){
        
        
    }
    private func drawLine(from start: CGPoint,to end: CGPoint,ofColor color: CGColor){
    
// UIBezierPath() A path that consists of straight and curved line segments that you can render in your custom views.
//        let path = UIBezierPath()
        
        path.move(to: start)
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath // render the path
//        shapeLayer.strokeColor = UIColor.orange.cgColor // border
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 30
        
        self.layer.addSublayer(shapeLayer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        path.removeAllPoints() // remove UIBezierPath
        guard let touch = touches.first else { return  }
        let touchPoint = touch.location(in: self)
        if touchPoint.y < 0 || touchPoint.y > self.frame.height {
            return
        }
//            print(touchPoint)// print x and y
        
//        print(touchPoint.y)
//        delegate?.getValue(sliderVal: touchPoint.y)
        
//        self.frame.midX
        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 to: CGPoint(x: self.frame.width/2,
                             y: touchPoint.y),
                 ofColor: UIColor.lightGray.cgColor)
        value = Float(touchPoint.y)
//        let diff = CGFloat(maximumValue - minimumValue)
//        value = maximumValue - Float(touchPoint.y * diff / self.frame.height)
    }
}



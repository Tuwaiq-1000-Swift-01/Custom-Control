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
//@IBDesignable
class Slider: UIControl{
    let shapeLayer = CAShapeLayer()
    var path = UIBezierPath()
    var delegate : Val?
    @IBInspectable var maximumValue: Float = 7
    @IBInspectable var minimumValue: Float = 1
    @IBInspectable  var value: Float = 4
    
    


    @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var Color: UIColor? {
            get {
                guard let cgColor = shapeLayer.strokeColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { shapeLayer.strokeColor = newValue?.cgColor }
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
        
    }
    private func setup(){
        let diff = CGFloat(maximumValue - minimumValue)
        value = Float(( CGFloat(value) / diff * self.frame.height)) + maximumValue
        print("max: \(maximumValue), min: \(minimumValue), diff: \(diff)")
        let valDdiv = value / Float(diff)
        print("value: \(value), value / diff \(valDdiv) ")
        let result = valDdiv * Float(self.frame.height) + maximumValue
        print("height: \(self.frame.height), value / diff * height + max: \(result)")
        print("value float = \(value), value CGFloat= \(CGFloat(value))")
        
        path.move(to: CGPoint(x: self.frame.width / 2, y: 250))
        path.addLine(to: CGPoint(x: self.frame.width / 2, y: CGFloat(value)))
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.lineWidth = 30
        
        self.layer.addSublayer(shapeLayer)
//        print("frame hieght: " , self.frame.height)
//        print("value: ", value)
        
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

        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 to: CGPoint(x: self.frame.width/2,
                             y: touchPoint.y),
                 ofColor: self.Color!.cgColor)
//        value = CGFloat(Float(touchPoint.y))
        let diff = CGFloat(maximumValue - minimumValue)
        value = maximumValue - Float(touchPoint.y * diff / self.frame.height)
//        print(value)
        sendActions(for: .touchDragInside)
    }
}



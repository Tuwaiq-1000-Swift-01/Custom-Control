
//  Slider.swift
//  Slider
//  Created by Jawaher🌻 on 13/06/1443 AH.

import UIKit

class Slider: UIControl{
    
    let shapeLayer = CAShapeLayer()
    var label = UILabel()
    
    @IBInspectable  var color: UIColor = UIColor.orange
    @IBInspectable  var maximumValue : Float = 7
    @IBInspectable  var minimumValue : Float = 1
    @IBInspectable  var value : Float = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private  func  setup() {
        self.backgroundColor = #colorLiteral(red: 0.7343089605, green: 0.686042266, blue: 0.8229154273, alpha: 1)
        self.layer.cornerRadius = 35
        label.frame = CGRect(x: 100, y: -100, width: 100, height: 100)
        label.font = UIFont(name: "Avenir-Light", size: 31.0)
        label.textColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
    
    private  func  drawLine(from start: CGPoint ,toPoint end: CGPoint,ofColor color: UIColor) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to:end)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 70
        addSubview(label)
        self.layer.addSublayer(shapeLayer)
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        var touchePoint = touch.location(in: self)
        
        if touchePoint.y < 0 || touchePoint.y > self.frame.height {
            return
        }
        
        
        
        drawLine(from: CGPoint(x: self.frame.width/2 , y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2, y: touchePoint.y),
                 ofColor: color)
        
        let different = CGFloat(maximumValue - minimumValue)
        value = maximumValue - Float(touchePoint.y * different / self.frame.height)
        label.text = String(format: "%.2f", value)
        
    }
}

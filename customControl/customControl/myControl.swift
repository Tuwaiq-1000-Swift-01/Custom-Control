//
//  myControl.swift
//  customControl
//
//  Created by Osama folta on 13/06/1443 AH.
//

import UIKit
class MyControl:UIControl{
    //A layer that draws a cubic Bezier spline in its coordinate space.
    var shabeLayer = CAShapeLayer()
    //A path that consists of straight and curved line segments that you can render in your custom views.
    var label = UILabel()

    @IBInspectable var maxValue:Float = 10
    @IBInspectable var minValue:Float = 0
    @IBInspectable var currentValue:Float = 0
    @IBInspectable var cornerRadius:Float = 0
    @IBInspectable var borderWidth:Float = 0
    
    required init?(coder aDecoder: NSCoder){
     super.init(coder: aDecoder)
        print("currentValue",currentValue)
    }
    private  func drawLine(from start:CGPoint,to end:CGPoint) {
        let path = UIBezierPath()

        path.move(to: start)
        path.addLine(to: end)
        shabeLayer.path = path.cgPath
        shabeLayer.strokeColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        shabeLayer.lineWidth = 55
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = .init(red: 1, green: 0, blue: 0.2, alpha: 0.8)
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.addSublayer(shabeLayer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in:self)
     
        if touchPoint.y < 0 || touchPoint.y > self.frame.height{
            return
        }
        drawLine(from: CGPoint(x: frame.width/2, y: frame.height),
                 to: CGPoint(x: frame.width/2, y: touchPoint.y))
        let defference = CGFloat(maxValue - minValue)
        currentValue = maxValue - Float(touchPoint.y * defference/self.frame.height)
        print("currentValue",currentValue)
      
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
  
           label.center = CGPoint(x: frame.width/2, y: 285)
           label.textAlignment = .center
        label.text = String(format: "%.2f", currentValue)

          addSubview(label)
    }
}
//الحواف دايريه اضافه ليبل لعرض القيمه فيه (القيمه يجب ان تختصر لخانتين فقط)

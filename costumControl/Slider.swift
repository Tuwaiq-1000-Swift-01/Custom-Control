//
//  Slider.swift
//  costumControl
//
//  Created by Afnan Theb on 13/06/1443 AH.
//

import Foundation
import UIKit


class Slider : UIControl  {
   
    
    
    let shapeLayer = CAShapeLayer()
    var start: Bool = true
    @IBInspectable var color = UIColor.orange
   @IBInspectable var maximumValue : Float = 4
   @IBInspectable var minimumValue : Float = 0
    @IBInspectable var value : Float = 0  {
       didSet {
        if start == true {
          drawStartLine(value: value, min: minimumValue, max: maximumValue)
        }
       }
   }
    //var stringValue : String = "0"
    
    required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
        setup()

        
    }
    func setup(){
      self.backgroundColor = .lightGray
      self.layer.cornerRadius = 25
       // path.move(to: CGPoint(x: 0, y: 0))
       // path.addLine(to: CGPoint(x: 100, y:100))
        
        //shapeLayer.path = path.cgPath
       // shapeLayer.strokeColor = UIColor.orange.cgColor
        
        self.layer.addSublayer(shapeLayer)

    }
        func drawStartLine(value: Float, min: Float, max: Float){
              print("start", value, max, min)
           
             
                let diff = CGFloat(max - min)
             

                let setValue = Float(( CGFloat(value) / diff * self.frame.height)) + max
                 
                drawLine(from : CGPoint(x: (self.frame.width/2) ,
                               y: self.frame.height ),
                       toPoint : CGPoint(x: self.frame.width/2,
                                y: CGFloat(setValue) - self.frame.height),
                             ofColor : color )
                print("set value : \(setValue)")
                print(formattedValue(value: setValue))
             
             

            start = false
          }
    private func drawLine(from start : CGPoint,
                 toPoint end: CGPoint,
                 ofColor color :UIColor) {
        let path = UIBezierPath()
        path.move(to: start )
        path.addLine(to: end)
        shapeLayer.lineWidth = (self.frame.width )/2
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        
        self.layer.addSublayer(shapeLayer)
         
      }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let touchPoint = touch.location(in: self)
        if touchPoint.y < 0 || touchPoint.y > self.frame.height{
          return
        }
        drawLine(from : CGPoint(x: (self.frame.width/2) ,
                    y: self.frame.height ),
             toPoint : CGPoint(x: self.frame.width/2,
                      y: touchPoint.y),
             ofColor : UIColor.orange)
        let diff = maximumValue - minimumValue
        value = maximumValue - Float(touchPoint.y * CGFloat(diff) / self.frame.height)
        print("value : \(touchPoint.y)")
        print(formattedValue(value: value))

        addTarget(self, action: #selector(changeValue), for: .touchUpInside)
      }
    @objc func changeValue(){
      print("ChangeValue: \(value)")
        sendActions(for: .valueChanged)
      }
     
    
    func formattedValue (value : Float) -> String {
        let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2

                let number = NSNumber(value: value)
                let formattedValue = formatter.string(from: number)!
    
        return formattedValue
    }
    
    
    
}


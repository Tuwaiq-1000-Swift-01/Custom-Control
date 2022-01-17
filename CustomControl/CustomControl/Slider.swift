//
//  Slider.swift
//  CustomControl
//
//  Created by A A on 16/01/2022.
//

import UIKit

class Slider: UIControl {
  
  let shapeLayar = CAShapeLayer()
  @IBInspectable var color: UIColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
  
  @IBInspectable var maxValue: Float = 5
  @IBInspectable var minValue: Float = 0
  @IBInspectable var value: Float = 0
  
  required init?(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)
    
    setup()
  }
  
  
  func setup(){
    self.backgroundColor = .gray
    //Rounded
    self.layer.cornerRadius = 8
  }
  
  
  private func drawLine(from start: CGPoint, toPoint end: CGPoint, ofColor color: UIColor){
    
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    
    shapeLayar.path = path.cgPath
    shapeLayar.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    shapeLayar.lineWidth = 10
    self.layer.addSublayer(shapeLayar)
    
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    guard let touch = touches.first else { return}
    let touchPoint = touch.location(in: self)
    
    if touchPoint.y < 0  || touchPoint.y > self.frame.height {
      return
    }
    drawLine(from: CGPoint(x: self.frame.width / 2,
                           y: self.frame.height),
             toPoint: CGPoint(x: self.frame.width / 2,
                              y: touchPoint.y),
             ofColor: color)
    
    let diff = CGFloat(maxValue - minValue)
    value = maxValue - Float(touchPoint.y * diff / self.frame.height)
    print(value)
    
    NotificationCenter.default.post(name: Notification.Name.init(rawValue: "updateValue"), object: nil, userInfo: ["value" : value])
    
  }
  
}

//
//  Slider.swift
//  TestSlider
//
//  Created by Aisha Ali on 1/16/22.
//

import UIKit





class Slider:UIControl {
  
  let shapeLayer = CAShapeLayer()
  
  let valueLabel = UILabel(frame: CGRect(x: 0, y: 650, width: 200, height: 21))
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf }()
  
  @IBInspectable  var Maximum:Float{
    
    get {
      return max
      
    } set {
      
      max = newValue
    }
  }
  
  @IBInspectable  var Minimum:Float{
    
    get {
      return min
      
    } set {
      min = newValue
    }
  }
  
  @IBInspectable  var Color: UIColor {
    
    get {
      return color
      
    }set {
      
      color = newValue
    }
  }
  
  
  @IBInspectable  var Value: CGFloat {
    
    get {
      return defaultValue
      
    }set {
      
      defaultValue = newValue
    }
  }
  
  
  
  
  
  
  
  var value:CGFloat = 0
  var max: Float = 7
  var color: UIColor = UIColor.green
  var min:Float = 0
  var defaultValue:CGFloat = 400
  
  
  required init?(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)
    
    setUp()
    
  }

  
  func setUp(){
    //    value = max
    self.backgroundColor = .lightGray
    self.layer.cornerRadius = 30
    valueLabel.textAlignment = .center
    


    
    
    drawLine(
      from: CGPoint(x: self.frame.width/2,y: self.frame.height+24),
      toPoint: CGPoint(x: self.frame.width/2, y: CGFloat(defaultValue)))

    
    
  }
  
  
  func drawLine(from:CGPoint, toPoint:CGPoint){
    let path = UIBezierPath()
    
    path.move(to: from)
    path.addLine(to: toPoint)
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = color.cgColor
    shapeLayer.lineWidth = 30
    self.layer.addSublayer(shapeLayer)
    self.addSubview(valueLabel)
    
    
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    guard let touch = touches.first else {return}
    let touchPoint = touch.location(in: self)
    if touchPoint.y < 0 || touchPoint.y > self.frame.height {
      return
      
    }
    
    print(touchPoint)
    
    
    drawLine(from: CGPoint(x: self.frame.width/2,
                           y: self.frame.height),
             toPoint: CGPoint(x:self.frame.width/2,
                              y: touchPoint.y))
    
    let diff = CGFloat(max - min)
    value = CGFloat(max - Float(touchPoint.y * diff / self.frame.height))
    print(value)
    valueLabel.text = numberFormatter.string(from: NSNumber(value: value))
    print("\n\n\nMy Default value \(defaultValue)\n\n\n")

    
    
  }
  
  
  
  
  
  
}

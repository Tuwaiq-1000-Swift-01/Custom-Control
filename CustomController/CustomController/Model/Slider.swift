

import UIKit

class Slider: UIControl {
  
  let shapeLayer = CAShapeLayer()
  
  var label = UILabel(frame: CGRect(x: 0.0,
                                    y: 390.0,
                                    width: 122,
                                    height: 30))
  
  let numberFormatter: NumberFormatter = {
    let number = NumberFormatter()
    number.numberStyle = .decimal
    number.minimumFractionDigits = 0
    number.maximumFractionDigits = 1
    return number
  }()
  
  var color = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
  
  @IBInspectable var maximumValue: Float = 5
  @IBInspectable var minimumValue: Float = 0
  @IBInspectable var value: Float = 0
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUp()
    
  }
  
  
  private func setUp(){
    self.backgroundColor = #colorLiteral(red: 0.8999490142, green: 0.8594202399, blue: 0.8074750304, alpha: 1)
    // make slider rounded
    self.layer.cornerRadius = 25
    // desgin for label
    label.textAlignment = .center
    label.backgroundColor = #colorLiteral(red: 0.8226228952, green: 0.7461921573, blue: 0.6602353454, alpha: 1)
  }
  
  
  // this way to named func in swift
  private func drawLine(from start: CGPoint,toPoint end: CGPoint,ofColor color: UIColor){
    
    let path = UIBezierPath()
    
    path.move(to: start)
    path.addLine(to: end)
    
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = #colorLiteral(red: 0.8226228952, green: 0.7461921573, blue: 0.6602353454, alpha: 1)
    shapeLayer.lineWidth = 50
    self.layer.addSublayer(shapeLayer)
    self.addSubview(label)
    
  }
  
  // this func when user touch the slider
  override func touchesMoved(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    guard let touch = touches.first else {return}
    
    let touchPoint = touch.location(in: self)
    if touchPoint.y < 0 || touchPoint.y > self.frame.height {
      return
    }
    
    drawLine(from: CGPoint(x: self.frame.width/2,
                           y: self.frame.height),
             toPoint: CGPoint(x: self.frame.width/2,
                              y: touchPoint.y),
             ofColor: color)
    
    let diff = CGFloat(maximumValue - minimumValue)
    
    value =
    maximumValue - Float(touchPoint.y * diff / self.frame.height)
    
    label.text =
    numberFormatter.string(from: NSNumber(value: value))
    
    print(value)
  }
}

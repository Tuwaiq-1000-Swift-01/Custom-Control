

import UIKit

class Slider : UIControl {
  
  let shapeLayer = CAShapeLayer()
  
  var color = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
  
  @IBInspectable  var maxValue: Float = 7
  @IBInspectable  var minValue: Float = 1
  @IBInspectable  var value: Float = 0
  
  
  required init?(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)
    setup()
    
  }
  
  
  func setup() {
    self.backgroundColor = .cyan
    
    //rounded corners for the view
    self.layer.cornerRadius = 15
    
  }
  
  
  func drawLine(start: CGPoint,
                end: CGPoint,
                color: UIColor){
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    shapeLayer.lineWidth = 10
    
    self.layer.addSublayer(shapeLayer)
    
  }
  
  
  override func touchesMoved(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    
    
    guard let touch = touches.first else {return}
    let touchPoint  = touch.location(in: self)
    
    if touchPoint.y < 0 || touchPoint.y > self.frame.height{return}
    
    
    drawLine(start: CGPoint(x: self.frame.width / 2,
                            y: self.frame.height),
             end: CGPoint(x: self.frame.width / 2,
                          y: touchPoint.y),
             color: color)
    
    let diff = CGFloat(maxValue - minValue)
    value = minValue - Float(touchPoint.y * diff / self.frame.height)
    
    print(value)
    
    
    NotificationCenter.default.post(name: Notification.Name.init(rawValue: "updateValue"),
                                    object: nil,
                                    userInfo: ["value" : value])
    
  }
  
}

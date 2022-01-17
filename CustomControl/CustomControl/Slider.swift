
import UIKit


class Slider : UIControl {
    var end : Float = 0.88
    static let instance = Slider()

  var s : Float = 5.666
  let shapeLayer = CAShapeLayer()
 
  var color = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
  
  var maxValue: Float = 7
  var minValue: Float = 1
  var value: Float = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
  
  required init?(coder aDecoder: NSCoder){
     super.init(coder: aDecoder)
      print("max \(maxValue)")
      setup()
  }
  
  
  func setup() {
      self.backgroundColor = .green
      self.layer.cornerRadius = 12 // rounded

  }
  
  
  private func drawLine(start: CGPoint,
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
      let f = ViewController()
    f.scoreSelected(value)
      
    let roundedValue = round(value * 10) / 10.0 // to make the value rounded
      
      
      
      // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "scoreSelected"), object: nil, userInfo: ["value" : roundedValue])


      

  }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end point")
        end = value
        print(value)
        UserDefaults.standard.set(end, forKey: "val")

    }
    
    
    
}

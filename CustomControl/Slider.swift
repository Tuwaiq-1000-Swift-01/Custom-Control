
import UIKit



class Slider: UIControl{
    
    var delegat: SliderV?
    
    let shapeLayer = CAShapeLayer() // view this class
    var color = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    
    @IBInspectable var maxValue: Double = 6
    @IBInspectable var minValue: Double = 0
    var value: Double = 0
    
    // to create custom control for me
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
        
    }
    
    private func setUp(){
        self.backgroundColor = .cyan
        self.layer.cornerRadius = 8
        
    }
    
    
    private func drawLine(from start: CGPoint, toPoint end: CGPoint, ofcolor color: UIColor){
        let path = UIBezierPath() // declration here for I can up and down
        path.move(to: start)
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        shapeLayer.lineWidth = 3 //Property to change size line
        self.layer.cornerRadius = CGFloat(0)
        self.layer.addSublayer(shapeLayer)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: self)

        // to stop if exit from frame view
        if touchPoint.y < 0 || touchPoint.y > self.frame.height {
            return
        }
        
        drawLine(
            from: CGPoint(x: self.frame.width/2,
                          y: frame.height),
            toPoint:CGPoint(x: self.frame.width/2,
                            y: touchPoint.y),
            ofcolor: color)
        
        // Determine the maximum and minimum limits for drawing
        let diff = CGFloat( maxValue - minValue)
        value = maxValue - Double(touchPoint.y * diff / self.frame.height)
        
        self.addTarget(self, action: #selector(sliderDidChangedValue), for: .valueChanged)
        
        
    }
    
    @objc func sliderDidChangedValue(){
        delegat?.valuChanged(value: Float((value)))

         }
    
    
}

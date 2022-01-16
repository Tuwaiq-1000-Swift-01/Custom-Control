//
//  Slider.swift
//  SliderTuwaiq
//
//  Created by Atheer Othman on 13/06/1443 AH.
//

import UIKit


 class Slider: UIControl {
    
    let shapeLayer = CAShapeLayer()
     
     var delegat: SliderValue?
     
    @IBInspectable var maxValue: Float = 5
    @IBInspectable var minValue: Float = 0
    @IBInspectable var value: Float = 0
    @IBInspectable var color: UIColor = #colorLiteral(red: 1, green: 0.6122354865, blue: 0.1313981712, alpha: 1)
    @IBInspectable var backgrounColorolor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        self.backgroundColor = backgrounColorolor
        self.layer.cornerRadius = 15
    }
    
    private func drawLine(from start: CGPoint, toPoint end: CGPoint, ofColor color: UIColor){
        let path = UIBezierPath()
        
        path.move(to:start)
        path.addLine(to: end)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 50
        self.layer.addSublayer(shapeLayer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: self)
        
        if touchPoint.y < 0 || touchPoint.y > self.frame.height {
            return
        }
        
        drawLine(from: CGPoint(x: self.frame.width/2,
                               y: self.frame.height),
                 toPoint: CGPoint(x: self.frame.width/2,
                                  y: touchPoint.y),
                 ofColor: color)
        
        let diff = CGFloat(maxValue - minValue)
        value = maxValue - Float(touchPoint.y * diff / self.frame.height)
        
        let vc = ViewController()
        vc.slider?.value = value
        
        self.addTarget(self, action: #selector(sliderDidChangedValue), for: .valueChanged)
        print(round(value))
        delegat?.sliderValuChanged(value: round(value))
    }
    
     @objc func sliderDidChangedValue(){
         print("Toutched Finally")
     }
}

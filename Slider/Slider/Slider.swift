//
//  Slider.swift
//  Slider
//
//  Created by MAC on 13/06/1443 AH.
//
import Foundation
 import UIKit

 class Slider:UIControl {
     let shapeLayer = CAShapeLayer()
     @IBInspectable var color: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
     @IBInspectable var minValue: Float = 3
     @IBInspectable var maxValue: Float = 10
     @IBInspectable private(set) var value:Float = 0


     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setup()
     }


     private func setup(){
         self.backgroundColor = .green
         self.layer.cornerRadius = 20
         self.clipsToBounds = true

         drawLine(from: CGPoint(x: self.frame.width/2,y: self.frame.height),
                  toPoint: CGPoint(x: self.frame.width/2,
                                   y: self.frame.height/2)
                  ,ofColor: color)
     }
  
     private func drawLine(from start: CGPoint,toPoint end: CGPoint,ofColor color:UIColor){
         let path = UIBezierPath()

         path.move(to: start)
         path.addLine(to: end)
         shapeLayer.cornerRadius = 20
         shapeLayer.path = path.cgPath
         shapeLayer.strokeColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
         shapeLayer.lineWidth = 200
         self.layer.addSublayer(shapeLayer)
     }

     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         guard let touch = touches.first else {return}
         let touchPoint = touch.location(in: self)

         if touchPoint.y < 0 || touchPoint.y > self.frame.height{
             return
         }
         drawLine(from: CGPoint(x: self.frame.width/2,
                                y: self.frame.height),
                  toPoint: CGPoint(x: self.frame.width/2,
                                   y: touchPoint.y),
                  ofColor: color)
         let diff = CGFloat( maxValue - minValue)
         value = maxValue - Float(touchPoint.y * diff / self.frame.height)
     }

    }
    
    
    
    
    
    
    
    
    
    
//    private func drawTriangle() {
//
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: 0, y: 200))
//            path.addLine(to: CGPoint(x: 100, y: 0))
//            path.addLine(to: CGPoint(x: 200, y: 200))
//            path.addLine(to: CGPoint(x: 0, y: 200))
//
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.strokeColor = UIColor.red.cgColor
//            shapeLayer.fillColor = UIColor.green.cgColor
//            shapeLayer.lineWidth = 3
//
//            self.layer.addSublayer(shapeLayer)
//        }
//
//
//    private func drawOval() {
//
//            let path = UIBezierPath(ovalIn: self.bounds)
//
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.fillColor = UIColor.orange.cgColor
//            shapeLayer.lineWidth = 3
//            shapeLayer.strokeColor = UIColor.black.cgColor
//
//            self.layer.addSublayer(shapeLayer)
//        }
//
//
//    private func drawRandomShape() {
//
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: 0, y: 200))
//
//            path.addLine(to: CGPoint(x: 0, y: 125))
//            path.addLine(to: CGPoint(x: 50, y: 125))
//            path.addLine(to: CGPoint(x: 50, y: 75))
//            path.addLine(to: CGPoint(x: 0, y: 75))
//            path.addLine(to: CGPoint(x: 0, y: 0))
//
//            path.addLine(to: CGPoint(x: 75, y: 0))
//            path.addLine(to: CGPoint(x: 75, y: 50))
//            path.addLine(to: CGPoint(x: 125, y: 50))
//            path.addLine(to: CGPoint(x: 125, y: 0))
//            path.addLine(to: CGPoint(x: 200, y: 0))
//
//            path.addLine(to: CGPoint(x: 200, y: 75))
//            path.addLine(to: CGPoint(x: 150, y: 75))
//            path.addLine(to: CGPoint(x: 150, y: 125))
//            path.addLine(to: CGPoint(x: 200, y: 125))
//            path.addLine(to: CGPoint(x: 200, y: 200))
//
//            path.addLine(to: CGPoint(x: 125, y: 200))
//            path.addLine(to: CGPoint(x: 125, y: 150))
//            path.addLine(to: CGPoint(x: 75, y: 150))
//            path.addLine(to: CGPoint(x: 75, y: 200))
//            path.addLine(to: CGPoint(x: 0, y: 200))
//
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.strokeColor = UIColor.black.cgColor
//            shapeLayer.lineWidth = 2
//            shapeLayer.fillColor = UIColor.green.cgColor
//
//            self.layer.addSublayer(shapeLayer)
//    }
//
//
//    private func drawArc() {
//
//            let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: .pi, clockwise: false)
//
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.fillColor = UIColor.orange.cgColor
//            shapeLayer.lineWidth = 3
//            shapeLayer.strokeColor = UIColor.black.cgColor
//
//            self.layer.addSublayer(shapeLayer)
//    }
//
//}

//
//  File.swift
//  evS
//
//  Created by Brian Shih on 5/18/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import Foundation
import UIKit


class recursiveLine: line {
      
    
   
  
    
    
    override func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint, thickness: CGFloat, context: CGContext) {
        
        
        // 2
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, thickness * 5)
        CGContextSetRGBStrokeColor(context, self.red, self.green, self.blue, 1.0)
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        // 4
        CGContextStrokePath(context)
        
        // 5
        
        
    }

    override func addLineFrom(fromPoint: CGPoint, toPoint: CGPoint, deltaT: NSTimeInterval) {
        
        lineArray += [(fromPoint, toPoint, deltaT, 0)]
    }
    
    
    override func drawLine(context: CGContext) {
        
        
        
        for (var i = 0; i < lineArray.count; i++){
            lineArray[i].3++
        }
        
        while lineArray.count > 0 && lineArray[0].3 > 10{
            lineArray.removeFirst()
        }
        
        for (var lineNum = 0; lineNum < self.lineArray.count; lineNum++){
            let line = self.lineArray[lineNum]
            self.drawLineFrom(line.0, toPoint: line.1, thickness: 1.5 - 0.5 * CGFloat(abs(5 - line.3)) / 10, context: context)
        }
        
       
//        for (var lineNum = 0; lineNum < self.lineArray.count; lineNum++){
//            let line = self.lineArray[lineNum]
//
//            var point1 = CGPointMake(line.0.x + 200, line.0.y + 200)
//            var point2 = CGPointMake(line.1.x + 200, line.1.y + 200)
//
//            self.drawLineFrom(line.0, toPoint: line.1, thickness: 1.5 - 0.5 * CGFloat(abs(5 - line.3)) / 10, context: context)
//        }
//
//        
//        
        
    }
    
    
    override func drawSegment(deltaTime0:[NSTimeInterval], _ coordinateArray0:[CGPoint], _ segmentNumber:Int, _ addX:CGFloat, _ addY:CGFloat){
        
        
        
        
        let realPoint1 = CGPoint(x: coordinateArray0[segmentNumber].x + addX, y: coordinateArray0[segmentNumber].y + addY)
        let realPoint2 = CGPoint(x: coordinateArray0[segmentNumber + 1].x + addX, y: coordinateArray0[segmentNumber + 1].y + addY)
        addLineFrom(realPoint1, toPoint: realPoint2, deltaT: deltaTime0[segmentNumber])
        delay(deltaTime0[segmentNumber]){
            if segmentNumber < deltaTime0.count - 1{
                self.drawSegment(deltaTime0, coordinateArray0, segmentNumber + 1, addX, addY)
            }else{
                self.drawSegment(deltaTime0, coordinateArray0, 0, realPoint2.x - coordinateArray0[0].x, realPoint2.y - coordinateArray0[0].y)
            }
        }
    }
    

    
    
    
}
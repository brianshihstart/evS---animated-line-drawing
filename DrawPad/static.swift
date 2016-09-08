//
//  File.swift
//  evS
//
//  Created by Brian Shih on 5/18/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import Foundation
import UIKit


class staticLine: line {
    
    
    
    
    
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
        
        
        
      
        
        for (var lineNum = 0; lineNum < self.lineArray.count; lineNum++){
            let line = self.lineArray[lineNum]
            self.drawLineFrom(line.0, toPoint: line.1, thickness: 1.5 - 0.5 * CGFloat(abs(5 - line.3)) / 10, context: context)
        }
        
        
        
    }
    
    
    override func drawSegment(deltaTime0:[NSTimeInterval], _ coordinateArray0:[CGPoint], _ segmentNumber:Int, _ addX:CGFloat, _ addY:CGFloat){
        
        
        
    }
    
    
    
    
    
}
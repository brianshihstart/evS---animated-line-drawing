//
//  File.swift
//  evS
//
//  Created by Brian Shih on 5/18/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//

import Foundation
import UIKit

// base class for other types on lines

class line {
    var deltaTime:[NSTimeInterval] = []
    var coordinateArray:[CGPoint] = []
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 2.0
    var opacity: CGFloat = 1.0
    var lineArray:[(CGPoint, CGPoint, NSTimeInterval, Int)] = []
    
    
    
    
    func delay(delay:Double, closure:()->()){
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ), dispatch_get_main_queue(), closure)
    }
    
    
    
    
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint, thickness: CGFloat, context: CGContext) {
        }
    
    func addLineFrom(fromPoint: CGPoint, toPoint: CGPoint, deltaT: NSTimeInterval) {
        
    }
    
    
    func drawLine(context: CGContext) {
    }
    
    
    func drawSegment(deltaTime0:[NSTimeInterval], _ coordinateArray0:[CGPoint], _ segmentNumber:Int, _ addX:CGFloat, _ addY:CGFloat){
         }
    
    
    
    
    
}
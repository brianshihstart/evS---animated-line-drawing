//
//  File.swift
//  evS
//
//  Created by Brian Shih on 5/14/16.
//  Copyright © 2016 Brian Shih. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var type = 1
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    @IBAction func doesntMove(sender: AnyObject) {
        
        if type == 0 {
            type = 1
        } else {
            type = 0
        }
    }
    
    
    var lastPoint = CGPoint.zero
    var lastTime:NSTimeInterval!
    
    var allLines = [line]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("drawAll"), userInfo:  nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
 
    var newestLine: line!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //start timer
        
        print("began")
        
        if type == 0 {
        allLines.append(staticLine())
        newestLine = allLines.last!
        }
        if type == 1 {
            allLines.append(recursiveLine())
            newestLine = allLines.last!
        }
        
        if type == 2 {
            allLines.append(samePointLine())
            newestLine = allLines.last!

            
        }
        
        
        lastTime = NSDate().timeIntervalSince1970
        
        
        if let touch = touches.first as UITouch! {
            lastPoint = touch.locationInView(self.view)
            
            newestLine.coordinateArray = [touch.locationInView(self.view)]
        }// second array contains lastPoint
    }
    
    var timeInMillis:Double = 0
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let currentTime = NSDate().timeIntervalSince1970 * 1000
        print(currentTime - timeInMillis)
        timeInMillis = currentTime
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)){
            
            // 6
            if let touch = touches.first as UITouch! {
                let currentPoint = touch.locationInView(self.view)
                //add current Point
                self.newestLine.coordinateArray += [currentPoint]
                //add the time onto the current point, and reset timer
                let currentTime = NSDate().timeIntervalSince1970
                self.newestLine.deltaTime += [currentTime - self.lastTime]
                self.lastTime = currentTime
                self.newestLine.addLineFrom(self.lastPoint, toPoint: currentPoint, deltaT: self.newestLine.deltaTime.last!)
                
                // 7
                self.lastPoint = currentPoint
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        self.newestLine.drawSegment(self.newestLine.deltaTime, self.newestLine.coordinateArray, 0, self.newestLine.coordinateArray[self.newestLine.coordinateArray.count - 1].x - self.newestLine.coordinateArray[0].x, self.newestLine.coordinateArray[self.newestLine.coordinateArray.count - 1].y - self.newestLine.coordinateArray[0].y)
        
    }

    
    func drawAll(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        for lines in allLines {
            lines.drawLine(context!)
            
        }
        
        self.tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        //self.tempImageView.alpha = self.opacity
        
          }
    
    
   
}



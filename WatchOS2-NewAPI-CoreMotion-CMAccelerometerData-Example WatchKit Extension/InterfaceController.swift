//
//  InterfaceController.swift
//  WatchOS2-NewAPI-CoreMotion-CMAccelerometerData-Example WatchKit Extension
//
//  Created by Wlad Dicario on 07/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class InterfaceController: WKInterfaceController {
    
    // MARK: - Interface
    @IBOutlet var xLbl: WKInterfaceLabel!
    @IBOutlet var yLbl: WKInterfaceLabel!
    @IBOutlet var zLbl: WKInterfaceLabel!
    @IBOutlet var xValues: WKInterfaceLabel!
    @IBOutlet var yValues: WKInterfaceLabel!
    @IBOutlet var zValues: WKInterfaceLabel!

    // MARK: - Properties
    private let motionManager = CMMotionManager()
    
    
    // MARK: - Context Initializer
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.xValues.setText("-")
        self.yValues.setText("-")
        self.zValues.setText("-")
    }

    
    // MARK: - Calls
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        // set manager updates
        getMotionManagerUpdates()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        // to stop updates
        self.motionManager.stopAccelerometerUpdates()
    }

    
    // MARK: - Get Accelerometer Data
    func getMotionManagerUpdates() {
        
        // init interval for update (NSTimeInterval)
        self.motionManager.accelerometerUpdateInterval = 0.1
        
        // get current accelerometerData
        if self.motionManager.accelerometerAvailable {
            
            // operation main queue
            let mainQueue: NSOperationQueue = NSOperationQueue.mainQueue()
           
            // start accelerometer updates
            self.motionManager.startAccelerometerUpdatesToQueue(mainQueue, withHandler: { (accelerometerData:CMAccelerometerData?, error:NSError?) -> Void in
                // errors
                if (error != nil) {
                    print("error: \(error?.localizedDescription)")
                }else{
                    // success
                    if ((accelerometerData) != nil) {
                        
                        // get accelerations values
                        let x:String = NSString(format: "%.2f", (accelerometerData?.acceleration.x)!) as String
                        let y:String = NSString(format: "%.2f", (accelerometerData?.acceleration.y)!) as String
                        let z:String = NSString(format: "%.2f", (accelerometerData?.acceleration.z)!) as String
                        
                        print("x: \(x)")
                        print("y: \(y)")
                        print("z: \(z)")
                        
                        // set text labels
                        self.xValues.setText(x)
                        self.yValues.setText(y)
                        self.zValues.setText(z)
                    }
                }
            })
        }
    }
}

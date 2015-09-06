//
//  ViewController.swift
//  WatchOS2-NewAPI-CoreMotion-CMAccelerometerData-Example
//
//  Created by Wlad Dicario on 07/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK: - Property
    private let motionManager = CMMotionManager()
    
    
    // MARK: - Calls
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getMotionManagerData()
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Get Accelerometer Data
    func getMotionManagerData() {
    
        self.motionManager.accelerometerUpdateInterval = 0.1
        
        if self.motionManager.accelerometerAvailable {
            let mainQueue: NSOperationQueue = NSOperationQueue.mainQueue()
            self.motionManager.startAccelerometerUpdatesToQueue(mainQueue, withHandler: { (accelerometerData:CMAccelerometerData?, error:NSError?) -> Void in
                //
                if (error != nil) {
                    print("error: \(error?.localizedDescription)")
                }else{
                    if ((accelerometerData) != nil) {
                        
                        let x:String = NSString(format: "%.2f", (accelerometerData?.acceleration.x)!) as String
                        let y:String = NSString(format: "%.2f", (accelerometerData?.acceleration.y)!) as String
                        let z:String = NSString(format: "%.2f", (accelerometerData?.acceleration.z)!) as String
                        print("x: \(x)")
                        print("y: \(y)")
                        print("z: \(z)")
                    }
                }
            })
        }
    }

}


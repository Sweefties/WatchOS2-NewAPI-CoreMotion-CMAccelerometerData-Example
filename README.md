![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-WatchOS2-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode%208-lightgrey.svg?style=flat-square)


# WatchOS2 -New API - Core Motion CMAccelerometerData - Example
WatchOS 2 Experiments - New API Components - CMAccelerometerData with Core Motion.

## Example

![](https://raw.githubusercontent.com/Sweefties/WatchOS2-NewAPI-CoreMotion-CMAccelerometerData-Example/master/source/Apple_Watch_template-CoreMotion-CMAccelerometer.jpg)


## Requirements

- >= XCode 8.0.
- >= Swift 3.

Tested on WatchOS2, iOS 9.0 Simulators, iPhone 6 8.4, Watch.

## Important

this is the Xcode 8 / Swift 3 updated project.

## Usage

To run the example project, download or clone the repo.

## Caution
CMAccelerometerData only work on physical Hardware (your Apple Watch, iPhone..), not on simulators..

### Example Code!


Configure :

- Drag and drop more WKInterfaceLabel to Interface Controller (Storyboard)
- connect your WKInterfaceLabel to your Interface Controller class
- import CoreMotion to your Interface Controller class
- put code to your controller class.

```swift

// create motion manager object
let motionManager = CMMotionManager()
```

- in willActivate() method

```swift
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
```


Build and Run on physical Apple Watch!

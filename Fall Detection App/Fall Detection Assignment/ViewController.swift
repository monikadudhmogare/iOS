//
//  ViewController.swift
//  Fall Detection Assignment
//  Created by Monika Dudhmogare on 10/21/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!

    @IBOutlet weak var stopBtn: UIButton!
    
    let randomVal = 999999.0
    var currentPosition: Double?
    var mManager : CMMotionManager?
    var KfilterFactor = 0.2
    var threadholdPercentage = 7.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.brown
        currentPosition = randomVal
        mManager = CMMotionManager();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBtn(_ sender: Any) {
        
        currentPosition = randomVal
        
        
        if  (mManager?.isAccelerometerAvailable)! {
            mManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(data: CMAccelerometerData?, error: Error?) in
                if (error != nil) {
                    self.mManager?.stopAccelerometerUpdates()
                } else {
                    let x = (data?.acceleration.z)! * self.KfilterFactor + (data?.acceleration.z)!*(1.0-self.KfilterFactor)
                    
                    if (self.currentPosition == self.randomVal) {
                        self.currentPosition = x
                    } else {
                        let alterChange =  ((x - self.currentPosition!)/self.currentPosition!) * 100
                        if (abs(alterChange) > self.threadholdPercentage &&  x < self.currentPosition!)
                        {
                            self.label.text = "Phone Fall: Detected Fall Scenerio"
                            self.view.backgroundColor = UIColor.darkGray
                        }
                        
                        self.currentPosition = x
                    }
                }
            })
        }

    }
    
    
    @IBAction func stopBtn(_ sender: Any)
    {
        
        //altimeter?.stopRelativeAltitudeUpdates()
        mManager?.stopAccelerometerUpdates()
        self.label.text = "Phone Fall: No Detected Fall Scenerio"
        self.view.backgroundColor = UIColor.blue
    }
    
    
}


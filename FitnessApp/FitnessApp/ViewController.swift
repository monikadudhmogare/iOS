//
//  ViewController.swift
//  FitnessApp
//
//  Created by Monika Dudhmogare on 10/9/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit
import HealthKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var nsteps: UITextField!
    @IBOutlet weak var ascendFloors: UITextField!
    @IBOutlet weak var descendFloors: UITextField!
    @IBOutlet weak var distance: UITextField!
    var pedometer: CMPedometer?
    
    @IBOutlet weak var begin: UIButton!
    @IBOutlet weak var stop: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pedometer = CMPedometer();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: UIButton)
    {
        
        if(sender.tag == 0)
        {
            print("Begin with the workout")
            pedometer?.startUpdates(from: NSDate() as Date, withHandler: { (data, error) in
            if(error != nil)
            {
                print("Error while fetching the pedometer data \(error)")
            }
            else
            {
                DispatchQueue.main.async {
                    if(CMPedometer.isStepCountingAvailable())
                    {
                        self.nsteps.text = "\(data!.numberOfSteps)"
                        print("Step \(data!.numberOfSteps)")
                    }
                    if(CMPedometer.isFloorCountingAvailable())
                    {
                        self.ascendFloors.text = "\((data?.floorsAscended)!.intValue)"
                        print("Ascending \((data?.floorsAscended)!.intValue)")
                        self.descendFloors.text = "\((data?.floorsDescended)!.intValue)"
                        print("Descending \((data?.floorsDescended)!.intValue)")
                    }
                    
                    if(CMPedometer.isDistanceAvailable())
                    {
                        let distanceString = String(format: "%.2f" ,(data?.distance)!.doubleValue)
                        self.distance.text = distanceString
                        print("Distance \(distanceString)")
                    }
                }
            }
                
            })
        }
        else if (sender.tag == 1)
        {
            print("Stop the Workout")
            pedometer?.stopUpdates()
        }
    }
}


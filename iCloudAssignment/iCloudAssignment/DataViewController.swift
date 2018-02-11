//
//  DataViewController.swift
//  iCloudAssignment
//
//  Created by Monika Dudhmogare on 10/1/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit
import CloudKit

class DataViewController: UIViewController
{
    
    
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var reason: UITextField!
    
    @IBOutlet weak var descrip: UITextField!
    
    var recordData = String()
    
    var alert: UIAlertController!
    
    let publicData = CKContainer.default().publicCloudDatabase
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        alert = UIAlertController(title: "Data", message: "New data has been saved", preferredStyle: UIAlertControllerStyle.alert)
        
        let actionOk = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        {
            Void in print("Save it")
        }
        
        alert.addAction(actionOk)

        
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let store = CKRecord(recordType: "CustomerService")
        
        store.setObject(location.text as CKRecordValue?, forKey: "cusLocation")
        store.setObject(reason.text as CKRecordValue?, forKey: "cusReason")
        store.setObject(descrip.text as CKRecordValue?, forKey: "cusDescription")
        
        publicData.save(store)
        {
            (saveRecord, error) in
            
            if error != nil
            {
                print("Error saving Data" + (error?.localizedDescription)!)
            }
                
            else
            {
                print("Data Saved successfully")
            }
        }
        
        self.present(self.alert, animated: true, completion: nil)
        self.location.text = ""
        self.reason.text = ""
        self.descrip.text = ""

    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    
    
}

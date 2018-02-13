//
//  InsertDataViewController.swift
//  FMDBDatabase Demo
//
//  Created by Monika Dudhmogare on 9/23/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit

class InsertDataViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtLocation: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
   
    @IBAction func btnCancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnInsertDataTapped(_ sender: Any) {
        
        var FMDBInfo:Tbl_Info = Tbl_Info()
        FMDBInfo.Name = txtName.text!
        FMDBInfo.Location = txtLocation.text!
        FMDBInfo.Address = txtAddress.text!
        FMDBInfo.Phone = txtPhone.text!
        FMDBInfo.Email = txtEmail.text!
        
        let isInserted =  FMDBDatabaseModel.getInstance().InsertData(FMDBInfo)
        if isInserted {
            Util.invokeAlertMethod(strTitle: "", strBody: " Insert data successfully ", delegate: nil)
        }
        else{
            Util.invokeAlertMethod(strTitle: "", strBody: " Error in inserting record", delegate: nil)
        }

        
    }
    
    
    
    /*// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  FMDBDatabase Demo
//
//  Created by Monika Dudhmogare on 9/23/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    @IBAction func btnInsertTapped(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InsertDataViewController") as! InsertDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
        
        
    }

}


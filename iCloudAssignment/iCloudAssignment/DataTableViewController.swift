//
//  DataTableViewController.swift
//  iCloudAssignment
//
//  Created by Monika Dudhmogare on 10/1/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import UIKit
import CloudKit

class DataTableViewController: UITableViewController {
    
    var NameArray: Array<CKRecord> = []
    
    // refresh the table
    
    var refresh: UIRefreshControl!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "Pull to load Data")
        refresh.addTarget(self, action: Selector("LoadData"), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresh)
        refresh.beginRefreshing()
        
        LoadOurData()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LoadOurData()
    {
        NameArray = Array<CKRecord>()
        
        let ourPublicDataBase = CKContainer.default().publicCloudDatabase
        
        let ourPredicate = NSPredicate(value: true)
        let ourQuery = CKQuery(recordType: "CustomerService", predicate: ourPredicate)
        
        ourQuery.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        ourPublicDataBase.perform(ourQuery, inZoneWith: nil){
        (results, error) in
            if error != nil
            {
                print("Error" + error.debugDescription)
            }
            else
            {
                for results2 in results!
                {
                    self.NameArray.append(results2)
                }
                OperationQueue.main.addOperation({ 
                    () -> Void in
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.refresh.endRefreshing()
                })
            }
        }
        
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OurCell", for: indexPath) as UITableViewCell

        // Configure the cell...
        
        let noteRecord: CKRecord = NameArray[(indexPath as IndexPath).row]
        
        cell.textLabel?.text = noteRecord.value(forKey: "cusLocation") as? String
        cell.detailTextLabel?.text = noteRecord.value(forKey: "cusReason") as? String

        return cell
    }
    
}

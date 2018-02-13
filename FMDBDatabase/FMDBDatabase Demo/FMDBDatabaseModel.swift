//
//  FMDBDatabaseModel.swift
//  FMDBDatabase Demo
//
//  Created by Monika Dudhmogare on 9/23/17.
//  Copyright © 2017 Monika Dudhmogare. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = FMDBDatabaseModel()
class FMDBDatabaseModel: NSObject {
    
    var database:FMDatabase? = nil
    
    class func getInstance() -> FMDBDatabaseModel {
        
        //        if(sharedInstance == nil)
        //        {
        sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "FMDBDatabase.sqlite"))
        
        return sharedInstance
    }
    
    //Insert Data into table
    func InsertData(_ Tbl_Info:Tbl_Info) -> Bool {
        sharedInstance.database!.open()
        
        //        let isInserted = sharedInstance.database!.executeQuery("INSER INTO Info(Name,Location,Address,Phone,Email) VLAUES(?,?,?,?,?)", withArgumetsIn: [Tbl_Info.Name,Tbl_Info.Location,Tbl_Info.Address,Tbl_Info.Phone,Tbl_Info.Email])
        
        let isInserted = sharedInstance.database!.executeUpdate ("INSERT INTO Info(Name,Location,Address,Phone,Email) VALUES(?,?,?,?,?)", withArgumentsIn: [Tbl_Info.Name,Tbl_Info.Location,Tbl_Info.Address,Tbl_Info.Phone,Tbl_Info.Email])
        sharedInstance.database!.close()
        return (isInserted != nil)
        
    }
    
}

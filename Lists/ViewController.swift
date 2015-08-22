//
//  ViewController.swift
//  Lists
//
//  Created by Bart Jacobs on 21/08/15.
//  Copyright © 2015 Tuts+. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch User Record ID
        fetchUserRecordID()
    }
    
    private func fetchUserRecordID() {
        // Fetch Default Container
        let defaultContainer = CKContainer.defaultContainer()
        
        // Fetch User Record
        defaultContainer.fetchUserRecordIDWithCompletionHandler { (recordID, error) -> Void in
            if let responseError = error {
                print(responseError)
                
            } else if let userRecordID = recordID {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.fetchUserRecord(userRecordID)
                })
            }
        }
    }
    
    private func fetchUserRecord(recordID: CKRecordID) {
        // Fetch Default Container
        let defaultContainer = CKContainer.defaultContainer()
        
        // Fetch Private Database
        let privateDatabase = defaultContainer.privateCloudDatabase
        
        // Fetch User Record
        privateDatabase.fetchRecordWithID(recordID) { (record, error) -> Void in
            if let responseError = error {
                print(responseError)
                
            } else if let userRecord = record {
                print(userRecord)
            }
        }
    }

}


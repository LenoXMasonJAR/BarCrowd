//
//  BarListViewController.swift
//  BarCrowd
//
//  Created by Mason Mahoney on 11/16/17.
//  Copyright © 2017 Mason Mahoney. All rights reserved.
//

import UIKit
import Foundation


var barArray = ["Woods", "BOB", "Tin Can", "Eve"]
var barNum = ["616-555-5555", "616-554-5555", "616-553-5555", "616-552-5555"]
var barCover = ["Cover: $5", "Cover: $5", "Cover: $2", "Cover: $10"]
var barDesc = ["Fun!", "Lame as Fuck", "Im so dumb", "Nick hurt imbezles chapter $$"]
var barAdd = ["53467 peters", "433232", "2332323", "3232323232"]
var myIndex = 0

class BarListViewController: UITableViewController {
    
    var userEmail : String?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = barArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        self.performSegue(withIdentifier: "barDesc", sender: self)
    }

}

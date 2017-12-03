//
//  BarListViewController.swift
//  BarCrowd
//
//  Created by Mason Mahoney on 11/16/17.
//  Copyright © 2017 Mason Mahoney. All rights reserved.
//

import UIKit
import Foundation


var barArray = ["B.O.B.'s Brewery", "Billy's Lounge", "Tin Can", "Eve"]
var barNum = ["616-356-2000", "616-459-5757", "616-552-5555"]
var barCover = ["Cover: $10", "Cover: N/A", "Cover: $10"]
var barDesc = ["Fun suff to do on a saturday with limited amounts of people with live music and a band!", "Lame as Fuck", "Im so dumb", "Nick hurt imbezles chapter $$"]
var barAdd = ["20 Monroe Ave NW", "1437 Wealthy St SE", "3232323232"]
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

//
//  BarDescriptionVC.swift
//  
//
//  Created by Mason Mahoney on 11/28/17.
//

import UIKit
import Foundation


class BarDescriptionVC: UIViewController{
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var cover: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address.text = barAdd[myIndex]
        phoneNum.text = barNum[myIndex]
        cover.text = barCover[myIndex]
        descrip.text = barDesc[myIndex]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

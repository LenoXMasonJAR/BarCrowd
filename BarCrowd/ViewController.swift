//
//  ViewController.swift
//  BarCrowd
//
//  Created by Mason Mahoney on 11/14/17.
//  Copyright © 2017 Mason Mahoney. All rights reserved.
//

import UIKit
//import FirebaseAuth
import FirebaseDatabase


class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    fileprivate var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // dismiss keyboard when tapping outside oftext fields
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        //self.ref = Database.database().reference()
        //self.registerForFirebaseUpdates()
        
        // make this controller the delegate of the text fields.
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
        //for dev
        self.emailField.text = "mahonema5@gmail.com"
        self.passwordField.text = "sextingIsFun"
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func validateFields() -> Bool {
        let pwOk = self.isValidPassword(password: self.passwordField.text)
        if !pwOk {
            print("Invalid password")
        }
        
        let emailOk = self.isValidEmail(emailStr: self.emailField.text)
        if !emailOk {
            print("Invalid email address")
        }
        
        return emailOk && pwOk
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if self.validateFields() {
            print(NSLocalizedString("Congratulations! You entered correct values.", comment: ""))
            self.performSegue(withIdentifier: "segueToMain", sender: self)
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMain" {
            if let destVC = segue.destination.childViewControllers[0] as? BarListViewController {
                destVC.userEmail = self.emailField.text
            }
            
        }
        if segue.identifier == "segueToRegister"{
            if let destVC1 = segue.destination.childViewControllers[0] as? RegisterViewController{
                destVC1.userEmail = self.emailField.text
            }
    }
  }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailField {
            self.passwordField.becomeFirstResponder()
        } else {
            if self.validateFields() {
                print(NSLocalizedString("Congratulations! You entered correct values.", comment: ""))
            }
        }
        return true
    }
}


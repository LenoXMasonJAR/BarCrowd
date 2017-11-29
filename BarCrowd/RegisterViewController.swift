//
//  RegisterViewController.swift
//  BarCrowd
//
//  Created by Mason Mahoney on 11/16/17.
//  Copyright © 2017 Mason Mahoney. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var userEmail: String?

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var verifyPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.verifyPasswordField.delegate = self

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    

    func validateFields() -> Bool {
        let pwOk = self.isEmptyOrNil(password: self.passwordField.text)
        if !pwOk {
            print("Invalid password")
        }
        let pwMatch = self.passwordField.text == self.verifyPasswordField.text
        if !pwMatch {
            print("Passwords do not match.")
        }
        let emailOk = self.isValidEmail(emailStr: self.emailField.text)
        if !emailOk {
            print("Invalid email address")
        }
        return emailOk && pwOk && pwMatch
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if self.validateFields() {
            print("Congratulations!  You entered correct values.")
            self.performSegue(withIdentifier: "segueToBarListFromRegister", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToBarListFromRegister" {
            if let destVC = segue.destination.childViewControllers[0] as? BarListViewController {
                destVC.userEmail = self.emailField.text
            }
        }
    }

}

extension RegisterViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailField {
            self.passwordField.becomeFirstResponder()
        } else if textField == self.passwordField {
            self.verifyPasswordField.becomeFirstResponder()
        } else {
            if self.validateFields() {
                print("Congratulations!  You entered correct values.")
            }
        }
        return true
    }
}

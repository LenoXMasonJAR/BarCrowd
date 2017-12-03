//
//  ViewController.swift
//  BarCrowd
//
//  Created by Mason Mahoney on 11/14/17.
//  Copyright © 2017 Mason Mahoney. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        showEmailAddress()
    }
    
    @objc func handleCustomFBLogin(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self)
        {(result, err) in
            if err != nil{
                print("Custom FB Login Failed:", err ?? "")
                return
            }
            self.showEmailAddress()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did logout with facebook")
    }
    
    func showEmailAddress(){
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else
        {return}
        let credentials =
            FacebookAuthProvider.credential(withAccessToken: accessTokenString )
        Auth.auth().signIn(with:credentials){
            (user, error) in
            if error != nil{
                print("Something went wrong with our FB user: ", error ?? "")
                return
            }
            self.findBars.isHidden = false
            print("Successful login with our user ", user ?? "")
            
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields":"id, name, email"]).start{
            (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err ?? "")
                return
            }
            print(result ?? "")
        }
    }
    
    
    @IBOutlet weak var findBars: UIButton!
    @IBAction func findBars(_ sender: Any) {
         self.performSegue(withIdentifier: "segueToMain", sender: self)
    }
    fileprivate var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // dismiss keyboard when tapping outside oftext fields
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
        findBars.isHidden = true
        
        let loginButtonFB = FBSDKLoginButton()
        view.addSubview(loginButtonFB)
        //frame's are obselete, please use constraints instead because its 2016 after all
        loginButtonFB.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
        loginButtonFB.delegate = self
        loginButtonFB.readPermissions = ["email", "public_profile"]
        
        //add custin FB login button
        let customFBButton = UIButton()
        customFBButton.backgroundColor = .blue
        customFBButton.frame = CGRect(x: 16, y: 116, width: view.frame.width - 32, height: 50)
        customFBButton.setTitle("Sign Up With Facebook", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(customFBButton)
        
        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        

    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


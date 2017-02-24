//
//  LoginViewController.swift
//  Parse Chat
//
//  Created by Daniel Sung on 2/23/17.
//  Copyright © 2017 Daniel Sung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let alertController = UIAlertController(title: "Login Error", message: "Email or password is incorrect", preferredStyle: .alert)

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        ParseClient.signUp(usrnm: emailTextField.text!, pw: passwordTextField.text!) { (succeed, error) in
            if succeed{
               self.performSegue(withIdentifier: "chatSegue", sender: nil)
            } else{
                self.present(self.alertController, animated: true)
                
            }
        }
        
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        ParseClient.login(usrnm: emailTextField.text!, pw: passwordTextField.text!) { (succeed, error) in
            if(succeed){
                self.performSegue(withIdentifier: "chatSegue", sender: nil)
            } else {
                self.present(self.alertController, animated: true)
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

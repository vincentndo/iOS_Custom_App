//
//  SignUpViewController.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/26/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmedTextField: UITextField!
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        guard let username = self.usernameTextField.text else { return }
        guard let emailAddress = self.emailAddressTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        guard let password2 = self.passwordConfirmedTextField.text else { return }

        if username == "" || emailAddress == "" || password == "" {
            let alert = UIAlertController(title: "Sign Up Error", message: "Please pick a username, enter your email address and set the password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else if password != password2 {
            let alert = UIAlertController(title: "Sign Up Error", message: "Password and confirmed password do not match", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            Auth.auth().createUser(withEmail: emailAddress, password: password) { (user, error) in
                if error == nil {
                    
                    let alert = UIAlertController(title: "Sign Up Success", message: "You successfully sign up.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                        self.performSegue(withIdentifier: "unwindFromSignUpToContentViews", sender: nil)
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true)

                } else {
                    
                    let alert = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                    
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

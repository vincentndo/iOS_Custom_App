//
//  LogInViewController.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/26/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        guard let username = self.usernameTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        if username == "" || password == "" {
            let alert = UIAlertController(title: "Log In Error", message: "Please enter username and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "unwindFromLogInToContentViews", sender: nil)
                } else {
                    let alert = UIAlertController(title: "Log In Error", message: error?.localizedDescription, preferredStyle: .alert)
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

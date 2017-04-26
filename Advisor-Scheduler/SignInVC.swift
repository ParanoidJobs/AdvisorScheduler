//
//  ViewController.swift
//  Advisor-Scheduler
//
//  Created by Samuel Zamudio on 4/24/17.
//  Copyright © 2017 Paranoid-Jobs. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let address = email.text, let pass = password.text {
            FIRAuth.auth()?.signIn(withEmail: address, password: pass, completion: { (user, error) in
                if error == nil {
                    // Successfully logged in.

                } else {
                    // Unable to log in.
                    print ("Unable to LOG IN")
                }
            
            })
        }
    }

    @IBAction func registerTapped(_ sender: Any) {
        performSegue(withIdentifier: "registerUser", sender: nil)
    }
}


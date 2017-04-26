//
//  RegisterVC.swift
//  Advisor-Scheduler
//
//  Created by Samuel Zamudio on 4/25/17.
//  Copyright © 2017 Paranoid-Jobs. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var userInfo: UISegmentedControl!
    @IBOutlet weak var userName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registrationComplete(_ sender: Any) {

        if let address = email.text, let pass = password.text, !address.isEmpty || !pass.isEmpty {
            FIRAuth.auth()?.createUser(withEmail: address, password: pass, completion: {(user, error) in
                if error != nil {
                    // User could not be created.
                
                } else {
                    // User was successfully created.
                    switch self.userInfo.selectedSegmentIndex {
                    case 0:
                        // create student object
                        print ("student")
                        let userData = ["Name": "samuel zamudio"]
                        DataService.ds.createStudent(uid: (user?.uid)!, userData: userData)
                        
                        break;
                    case 1:
                        // create an instructor object
                        print ("instructor")
                        if let name = self.userName.text, !name.isEmpty {
                            let userData = ["Name" : name]
                            DataService.ds.createInstructor(uid: (user?.uid)!, userData: userData)
                            self.performSegue(withIdentifier: "instructorHomePage", sender: nil)
                        }
                        break;
                    default:
                        print("Could not create user.")
                    }
                }
            })
        } else {
            errorMessage.alpha = 1
            errorMessage.text = "Enter valid Email/Password"
        }
    }
    
    @IBAction func backToSignIn(_ sender: Any) {
        performSegue(withIdentifier: "signIn", sender: nil)
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

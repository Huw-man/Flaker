//
//  ViewController.swift
//  Flaker
//
//  Created by Newman Hu on 11/3/18.
//  Copyright © 2018 Newman Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newCodeLabel: UILabel!
    @IBOutlet weak var joinCodeLabel: UITextField!
<<<<<<< HEAD
/*
=======

    
>>>>>>> 6d99db07e286362cae5bae3d6d8be87c735cfcb3
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle the code fields input through delegate callbacks
        joinCodeLabel.delegate = self
    }
<<<<<<< HEAD
*/
    /*
=======

>>>>>>> 6d99db07e286362cae5bae3d6d8be87c735cfcb3
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hides the keyboard
        textField.resignFirstResponder()
        return true
<<<<<<< HEAD
        }
 */
   // func textFieldDidEndEditing(_ textField: UITextField) {
      //  nameLabel.text = textField.text
    // }
    
=======
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = textField.text
        
    }

>>>>>>> 6d99db07e286362cae5bae3d6d8be87c735cfcb3
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        newCodeLabel.text = "Unique Code"
    }
    
    @IBAction func createParty(_ sender: UIButton) {
       let number = Int.random(in: 100000 ..< 999999)
       print(number)
       newCodeLabel.text = String(number)
    
    }
    
    @IBAction func joinParty(_ sender: UIButton)   {
    }
    
    @IBAction func startButton(_ sender: UIButton) {
}
}

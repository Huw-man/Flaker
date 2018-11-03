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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle the code fields input through delegate callbacks
        joinCodeLabel.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hides the keyboard
        textField.resignFirstResponder()
        return true
        }
   // func textFieldDidEndEditing(_ textField: UITextField) {
      //  nameLabel.text = textField.text
    // }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    
    @IBAction func createParty(_ sender: UIButton) {
       
    let number = Int.random(in: 100000 ..< 999999)
            print(number)
    
    }
    
    @IBAction func joinParty(_ sender: UIButton)   {
    }
    
    @IBAction func startButton(_ sender: UIButton) {
    }
    
}


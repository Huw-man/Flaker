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
    @IBOutlet weak var newCodeLabel: UITextField!
    @IBOutlet weak var joinCodeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle the code fields input through delegate callbacks
        newCodeLabel.delegate = self
    }
    
    //MARK: Actions
    @IBAction func createParty(_ sender: UIButton) {
        let code = Int.random(in: 100000..<1000000)
        
    }
    
    @IBAction func joinParty(_ sender: Any) {
    }
    

}


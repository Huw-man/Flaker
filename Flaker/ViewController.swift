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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hides the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = textField.text
        
    }

    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        newCodeLabel.text = "Unique Code"
    }
    
    @IBAction func createParty(_ sender: UIButton) {
       let number = Int.random(in: 100000 ..< 999999)
       // print(number)
       newCodeLabel.text = String(number)
    
    }
    
    @IBAction func joinParty(_ sender: UIButton)   {
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        print("start")
        
    }
    @IBAction func start2(_ sender: Any) {
        print("start2")
    
    //    @IBAction func startButton(_ sender: UIButton) {
        // begin navigation to destination
        print("redirecting to google maps")
        let url = "https://www.google.com/maps/dir/?api=1"
        var urlOptions = [
            UIApplication.OpenExternalURLOptionsKey(rawValue: "center") : "40.765819,-73.975866 ",
            "zoom" : 14,
            "views" : "traffic"

            ] as! [UIApplication.OpenExternalURLOptionsKey : Any]
        //check availability of google maps
        if (UIApplication.shared.canOpenURL(URL(string: url)!)) {
            UIApplication.shared.open(URL(string: url)!,
                                      options: [:],
                                      completionHandler: nil)

//            UIApplication.shared.openURL(URL(string:
//                "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic")!)
        } else {
            print("Can't use comgooglemaps://");
        }
    }
//
////        - (void)openURL:(NSURL *)url
////        options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options
////        completionHandler:(void (^)(BOOL success))completion;
//    }
}

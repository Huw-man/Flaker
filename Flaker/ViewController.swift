//
//  ViewController.swift
//  Flaker
//
//  Created by Newman Hu on 11/3/18.
//  Copyright © 2018 Newman Hu. All rights reserved.
//

import UIKit
import CoreData

protocol ViewControllerDelegate: class {
    func changePartySize(_ size:Int?)
    func updateUserID(_ id:Int?)
}

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newCodeLabel: UILabel!
    @IBOutlet weak var joinCodeLabel: UITextField!
    
    weak var delegate: ViewControllerDelegate?
    
    var user_id = 0
    var code = 0
    var psize = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // handle the code fields input through delegate callbacks
        joinCodeLabel.delegate = self
        //setup coredata
        
        
        
//        newUser.setValue("Shashikant", forKey: "userid")
//        newUser.setValue("1234", forKey: "code")
//        newUser.setValue(0.0, forKey: "lat")
//        newUser.setValue(0.0, forKey: "lon")
        
//        do {
//
//            try context.save()
//
//        } catch {
//
//            print("Failed saving")
//        }
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//        //request.predicate = NSPredicate(format: "age = %@", "12")
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "username") as! String)
//            }
//
//        } catch {
//
//            print("Failed")
//        }
        
    }
    
    func requestCoreData(key : String) -> String {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
//        do {
//            try context.save()
//        } catch {
//            print("Failed saving")
//        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                return (data.value(forKey: key) as! String)
//                print(data.value(forKey: "username") as! String)
            }
        } catch {
            print("Failed")
        }
        return "failed"
    }
    
    func putCoreData(value: Any, param: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(value, forKey: param)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 6
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
        newCodeLabel.text = String(number)
        let caller = HttpClient()
        caller.makePostCall(number, lat: AppDelegate.lat, lon: AppDelegate.lon)
        self.code = number
//        print("\(caller.re)")
        
    }
    
    @IBAction func joinParty(_ sender: UIButton)   {
        print(joinCodeLabel.text!)
        HttpClient().makePostCall(Int(joinCodeLabel.text!)!, lat: AppDelegate.lat, lon: AppDelegate.lon)
    }
    
    @IBAction func getPartySize(_ sender: UIButton) {
        let caller = HttpClient()
        caller.makeGetPartySize(code: self.code)
//        print("\(caller.party_size)")
        sender.setTitle(String(caller.party_size), for: .normal)
    }
    
    
    
    @IBAction func start(_ sender: Any) {
    
    //    @IBAction func startButton(_ sender: UIButton) {
        // begin navigation to destination
        print("redirecting to google maps")
        let url = "https://www.google.com/maps/dir/?api=1"
//        var urlOptions = [
//            UIApplication.OpenExternalURLOptionsKey(rawValue: "center") : "40.765819,-73.975866 ",
//            "zoom" : 14,
//            "views" : "traffic"
//
//            ] as! [UIApplication.OpenExternalURLOptionsKey : Any]
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

//
//  AppDelegate.swift
//  Flaker
//
//  Created by Newman Hu on 11/3/18.
//  Copyright © 2018 Newman Hu. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications    

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var lat = 0.0
    static var lon = 0.0
    
    //instance variables
    let center = UNUserNotificationCenter.current()
    let locationManager = CLLocationManager()
    static let geoCoder = CLGeocoder()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        }
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            locationManager.startUpdatingLocation()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        AppDelegate.lat = locValue.latitude
        AppDelegate.lon = locValue.longitude
        
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        // create CLLocation from the coordinates of CLVisit
//        let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
        
        // Get location description
//        AppDelegate.geoCoder.reverseGeocodeLocation(clLocation) { placemarks, _ in
//            if let place = placemarks?.first {
//                let description = "\(place)"
//                self.newVisitReceived(visit, description: description)
//            }
//        }
    }
    
    func newVisitReceived(_ visit: CLVisit, description: String) {
        let location = Location(visit: visit, descriptionString: description)
        // 1
        let content = UNMutableNotificationContent()
        content.title = "New Journal entry 📌"
        content.body = location.description
        content.sound = .default
        
        // 2
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: location.dateString, content: content, trigger: trigger)
        
        // 3
        center.add(request, withCompletionHandler: nil)
        // Save location to disk
    }
    
    
}


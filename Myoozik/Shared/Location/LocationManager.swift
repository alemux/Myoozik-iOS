//
//  LocationManager.swift
//  Myoozik
//
//  Created by Alessandro Bolattino on 04/04/18.
//  Copyright © 2018 Mussini SAS. All rights reserved.
//

//
//  LocationManager.swift
//  Diarly
//
//  Created by Alessandro Bolattino on 28/03/18.
//  Copyright © 2018 Diarly. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    var lastLocation = CLLocation()
    
    public private(set) var acceptableLocationAccuracy: CLLocationAccuracy = 80
    
    static let shared: LocationManager = LocationManager()
    
    override init() {
        super.init()
        configureLocationManager()
    }
    
    func configureLocationManager(){
        
        print("Called ConfigureLocationManager ");
        
        locationManager.delegate = self
        
        // status is not determined
        if CLLocationManager.authorizationStatus() == .notDetermined {
            
            print("Called notDetermined");
            locationManager.requestAlwaysAuthorization()
        }
            // authorization were denied
        else if CLLocationManager.authorizationStatus() == .denied {
            
            print("Called denied");
            print("Location services were previously denied. Please enable location services for this app in Settings.")
        }
            // we do have authorization
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            
            print("Called always");
            
        }
        
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.distanceFilter = 30;
        locationManager.pausesLocationUpdatesAutomatically = true
        
        
        
    }
    
    public func requestAlwaysAuthorization() {
        
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            
        }else{
            //include.dispatchNotif("Accetta localizzazione!");
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        NotificationManager.shared.sendNotification(titled: "didUpdateLocation", containing: "")
        if locations.count > 0 {
            self.lastLocation = locations.last!
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        print("stop")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       
    }
    
    private func acceptableLocationAccuracyRetrieved() -> Bool {
        if let location = self.lastLocation as? CLLocation {
            print("isLocation");
            
            if let accuracy = location.horizontalAccuracy as? CLLocationAccuracy {
                print("Location accuracy: \(location.horizontalAccuracy)");
                return Double(accuracy) <= acceptableLocationAccuracy ? true : false
            }
        }
        return false
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("DidFailWithError()")
        NSLog("\(error)")
        print("\n\n\n")
        
    }
    
    
}

//
//  ViewController.swift
//  ParkTime
//
//  Created by Marcus on 28/08/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import UIKit
import GoogleMaps

class MainViewController: UIViewController, CLLocationManagerDelegate
{
    var placePicker: GMSPlacePicker?
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
    {
        self.currentLocation = newLocation
    }
    
    @IBAction func pickLocation(sender: AnyObject)
    {
        let center = CLLocationCoordinate2DMake((currentLocation?.coordinate.latitude)!, (currentLocation?.coordinate.longitude)!)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        placePicker = GMSPlacePicker(config: config)
        
        placePicker?.pickPlaceWithCallback({ (place: GMSPlace?, error: NSError?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                let button = sender as! UIButton
                button.setTitle(place.name, forState: .Normal)
                self.performSegue("ShowRemainingParking")
            } else {
                print("No place selected")
            }
        })
    }
    
    private func performSegue(identifier: String)
    {
        performSegueWithIdentifier(identifier, sender: self)
    }
}


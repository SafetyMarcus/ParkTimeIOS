//
//  RemainingParkingNavController.swift
//  ParkTime
//
//  Created by Marcus on 29/08/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import Foundation
import UIKit

class RemainingParkingNavController: UINavigationController
{
    @IBAction func unwindToRemainingParks(unwindSegue: UIStoryboardSegue){}
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        return FadeUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
    }
}
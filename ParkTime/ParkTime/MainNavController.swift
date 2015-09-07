//
//  MainNavController.swift
//  ParkTime
//
//  Created by Marcus on 7/09/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import Foundation
import UIKit

class MainNavController: UINavigationController
{
    @IBAction func unwindToMain(segue: UIStoryboardSegue){}
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        return FadeUnwindSegue(identifier: identifier, source: fromViewController, destination: toViewController)
    }
}
//
//  FadeSegue.swift
//  ParkTime
//
//  Created by Marcus on 29/08/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import Foundation
import UIKit

class FadeSegue: UIStoryboardSegue
{
    override func perform()
    {
        let firstVC = self.sourceViewController.view as UIView
        let secondVC = self.destinationViewController.view as UIView
        secondVC.alpha = 0
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVC, aboveSubview: firstVC)
        
        UIView.animateWithDuration(0.5, animations:
            { () -> Void in
                secondVC.alpha = 1
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
        }
    }
}
//
//  FadeUnwindSegue.swift
//  ParkTime
//
//  Created by Marcus on 29/08/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import Foundation
import UIKit

class FadeUnwindSegue: UIStoryboardSegue
{
    override func perform()
    {
        let secondVC = self.sourceViewController.view as UIView!
        let firstVC = self.destinationViewController.view as UIView!

        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVC, aboveSubview: secondVC)
        
        UIView.animateWithDuration(0.4, animations:
            { () -> Void in
                secondVC.alpha = 0
            })
            { (Finished) -> Void in
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }

    }
}
//
//  RemainingParksController.swift
//  ParkTime
//
//  Created by Marcus on 29/08/2015.
//  Copyright © 2015 easygoingapps. All rights reserved.
//

import Foundation
import UIKit

class RemainingParksController: UIViewController
{
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewWillAppear(animated: Bool)
    {
        yesButton.addTarget(self, action: "showMoreInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        if(animated)
        {
            let height = self.view.bounds.height
            
            yesButton.bounds = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height/2)
            noButton.bounds = CGRectMake(0, self.view.bounds.height/2, self.view.bounds.width, self.view.bounds.height)
            
            yesButton.transform = CGAffineTransformMakeTranslation(0, height)
            noButton.transform = CGAffineTransformMakeTranslation(0, height)
        
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [],
                animations: {
                    self.yesButton.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
        
            UIView.animateWithDuration(1, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [],
                animations: {
                    self.yesButton.transform = CGAffineTransformMakeTranslation(0, 0)
                    self.noButton.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
        }
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        if(animated)
        {
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [],
                animations: {
                    let height = self.view.bounds.height
                    self.yesButton.transform = CGAffineTransformMakeTranslation(0, height)
                    self.noButton.transform = CGAffineTransformMakeTranslation(0, height)
                }, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "ShowMoreInfo")
        {
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                self.noButton.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.height)
                self.yesButton.bounds = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
                }, completion: nil)
        }
    }
    
    @IBAction func showMoreInfo(sender: AnyObject)
    {
        performSegueWithIdentifier("ShowMoreInfo", sender: self)
    }
}
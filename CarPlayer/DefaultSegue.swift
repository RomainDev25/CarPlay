//
//  DefaultSegue.swift
//  CarPlayer
//
//  Created by Peter Störmer on 28.01.15.
//  Copyright (c) 2015 Tempest Rock Studios. All rights reserved.
//

import UIKit

//
// A default segue class that does not do anything important.
// It's mainly necessary to get rid of the warning that a custom segue needs a custom segue class.
//
class DefaultSegue: UIStoryboardSegue {

    override func perform() {

        let sourceViewController: UIViewController = self.source 
        let destinationViewController: UIViewController = self.destination 
        sourceViewController.view.addSubview(destinationViewController.view)
        destinationViewController.view.removeFromSuperview()
      //  destinationViewController.view.removeFromSuperview()

        // Force presentViewController() into a different runloop.
        let time: TimeInterval = 0.001 * Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            sourceViewController.present(destinationViewController, animated: true, completion: nil)
        }
    }
}

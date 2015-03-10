//
//  SleepingInterfaceController.swift
//  PostalWatch
//
//  Created by 李逢双 on 3/8/15.
//  Copyright (c) 2015 Fudan. All rights reserved.
//

import WatchKit
import Foundation


class SleepingInterfaceController: WKInterfaceController {

    @IBOutlet weak var sleeping: WKInterfaceButton!
    var isSleeping = false
    let timer = Timer()
    
    @IBAction func sleepingAction() {
        if isSleeping {
            println("Sleeping End")
            timer.endCounting()
            sendToPhone()
            isSleeping = false
            sleeping.setBackgroundImage(UIImage(named: "icon_sleeping_red"))
        }
        else {
            println("Sleeping Start")
            timer.startCounting()
            isSleeping = true
            sleeping.setBackgroundImage(UIImage(named: "icon_sleeping_white"))
        }
    }
    
    func sendToPhone(){
        var data: [NSObject: AnyObject] = [:]
        data.updateValue(timer.duration, forKey: "duration")
        data.updateValue("sleep", forKey: "kind")
        func reply(info: [NSObject : AnyObject]!, error: NSError!){
            println("reply")
        }
        let a = WKInterfaceController.openParentApplication(data, reply)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

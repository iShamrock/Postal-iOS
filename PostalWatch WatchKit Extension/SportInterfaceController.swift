//
//  SportInterfaceController.swift
//  PostalWatch
//
//  Created by 李逢双 on 3/8/15.
//  Copyright (c) 2015 Fudan. All rights reserved.
//

import WatchKit
import Foundation


class SportInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var sport: WKInterfaceButton!
    var isSporting = false
    let timer = Timer()
    
    @IBAction func sportAction() {
        if isSporting {
            println("Sporting End")
            timer.endCounting()
            //println(timer.duration)
            sendToPhone()
            isSporting = false
            sport.setBackgroundImage(UIImage(named: "icon_running_red"))
        }
        else {
            println("Sporting Start")
            timer.startCounting()
            isSporting = true
            sport.setBackgroundImage(UIImage(named: "icon_running_white"))
        }
    }
    
    func sendToPhone(){
        var data: [NSObject: AnyObject] = [:]
        data.updateValue(timer.duration, forKey: "duration")
        data.updateValue("sport", forKey: "kind")
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

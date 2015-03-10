//
//  ReadingInterfaceController.swift
//  PostalWatch
//
//  Created by 李逢双 on 3/8/15.
//  Copyright (c) 2015 Fudan. All rights reserved.
//

import WatchKit
import Foundation


class ReadingInterfaceController: WKInterfaceController {

    var isReading = false
    let timer = Timer()
    @IBOutlet weak var reading: WKInterfaceButton!
    
    @IBAction func readingAction() {
        if isReading {
            println("Reading End")
            timer.endCounting()
            sendToPhone()
            println("\(timer.duration)")
            isReading = false
            reading.setBackgroundImage(UIImage(named: "icon_book_red"))
        }
        else {
            println("Reading Start")
            timer.startCounting()
            isReading = true
            reading.setBackgroundImage(UIImage(named: "icon_book_white"))
        }
    }
    
    func sendToPhone(){
        var data: [NSObject: AnyObject] = [:]
        data.updateValue(timer.duration, forKey: "duration")
        data.updateValue("read", forKey: "kind")
        func reply(info: [NSObject : AnyObject]!, error: NSError!){
            println("reply")
        }
        let a = WKInterfaceController.openParentApplication(data, reply)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        becomeCurrentPage()
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

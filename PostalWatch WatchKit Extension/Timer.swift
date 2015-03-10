//
//  Timer.swift
//  PostalWatch
//
//  Created by 李逢双 on 3/8/15.
//  Copyright (c) 2015 Fudan. All rights reserved.
//

import Foundation

class Timer {
    
    var startTime = NSDate()
    var endTime = NSDate()
    
    func startCounting() {
        startTime = NSDate()
        endTime = NSDate()
        println("starts at \(startTime.description)")
    }
    
    func endCounting() {
        endTime = NSDate()
        println("ends at \(endTime.description)")
    }
    
    var duration: String {
        var seconds = (Int)(endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970)
        var minutes = seconds / 60
        var hours = minutes / 60
        var days = hours / 24
        var time = ""
        
        if seconds == 0 {
            time = "less than 1 second"
        }
        else{
            seconds -= minutes * 60
            minutes -= hours * 60
            hours -= days * 24
            if days > 0 {
                time += " \(days) day"
                if days > 1 {
                    time += "s"
                }
            }
            if hours > 0 {
                time += " \(hours) hour"
                if hours > 1 {
                    time += "s"
                }
            }
            if minutes > 0 {
                time += " \(minutes) minute"
                if minutes > 1 {
                    time += "s"
                }
            }
            if seconds > 0 {
                time += " \(seconds) second"
                if seconds > 1 {
                    time += "s"
                }
            }
        }
        return time
    }
    
    
    
    
    
}
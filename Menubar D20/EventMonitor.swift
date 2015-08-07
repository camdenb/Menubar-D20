//
//  EventMonitor.swift
//  Menubar D20
//
//  Created by Camden Bickel on 8/6/15.
//  Copyright © 2015 Camden Bickel. All rights reserved.
//
//  Code from http://www.raywenderlich.com/98178/os-x-tutorial-menus-popovers-menu-bar-apps
//

import Cocoa

public class EventMonitor {
    private var monitor: AnyObject?
    private let mask: NSEventMask
    private let handler: NSEvent? -> ()
    
    public init(mask: NSEventMask, handler: NSEvent? -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(mask, handler: handler)
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
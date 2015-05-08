//
//  UIControlEventHandler.swift
//  RowyGenerator
//
//  Created by Cem Olcay on 08/05/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

typealias UIControlAction = (UIControl) -> Void

class UIControlEventHandler {
    
    // MARK: Properties
    
    var registeredEvents: [(UIControlEvents, UIControl, UIControlAction)]?
    
    
    // MARK: Singleton
    
    private static let instance = UIControlEventHandler()
    
    class func sharedInstance () -> UIControlEventHandler {
        return instance
    }
    
    
    // MARK: Event Management
    
    func registerEventForControl (event: UIControlEvents, control: UIControl, action: UIControlAction) {
        
        // Register Event
        
        if registeredEvents == nil {
            registeredEvents = [(event, control, action)]
        } else {
            registeredEvents!.append((event, control, action))
        }
        
        
        // Add Target
        
        control.addTarget(self, action: actionForEvent(event), forControlEvents: event)
    }
    
    func removeEventForControl (event: UIControlEvents, control: UIControl) {
        
        if registeredEvents == nil {
            return
        }
        
        var index = 0
        for (e, c, a) in registeredEvents! {
            if e == event && c == control {
                registeredEvents!.removeAtIndex(index)
                c.removeTarget(self, action: actionForEvent(e), forControlEvents: e)
            }
            
            index++
        }
    }
    
    
    // MARK: Events
    
    func actionForEvent (event: UIControlEvents) -> Selector {
        
        switch event {
            
        case UIControlEvents.AllEditingEvents:
            return Selector("allEditingEvents:")
            
        case UIControlEvents.AllEvents:
            return Selector("allEvents:")
            
        case UIControlEvents.AllTouchEvents:
            return Selector("allTouchEvents:")
            
        case UIControlEvents.allZeros:
            return Selector("allZeros:")
            
        case UIControlEvents.ApplicationReserved:
            return Selector ("applicationReserved")
            
        case UIControlEvents.EditingChanged:
            return Selector ("editingChanged:")
            
        case UIControlEvents.EditingDidBegin:
            return Selector ("editingDidBegin:")
            
        case UIControlEvents.EditingDidEnd:
            return Selector ("editingDidEnd:")
            
        case UIControlEvents.EditingDidEndOnExit:
            return Selector ("editingDidEndOnExit:")
            
        case UIControlEvents.SystemReserved:
            return Selector ("systemReserved:")
            
        case UIControlEvents.TouchCancel:
            return Selector ("touchCancel:")
            
        case UIControlEvents.TouchDown:
            return Selector ("touchDown:")
            
        case UIControlEvents.TouchDownRepeat:
            return Selector ("touchDownRepeat:")
            
        case UIControlEvents.TouchDragEnter:
            return Selector ("touchDragEnter:")
            
        case UIControlEvents.TouchDragExit:
            return Selector ("touchDragExit:")
            
        case UIControlEvents.TouchDragInside:
            return Selector ("touchDragInside:")
            
        case UIControlEvents.TouchDragOutside:
            return Selector ("touchDragOutside:")
            
        case UIControlEvents.TouchUpInside:
            return Selector ("touchUpInside:")
            
        case UIControlEvents.TouchUpOutside:
            return Selector ("touchUpOutside:")
            
        case UIControlEvents.ValueChanged:
            return Selector ("valueChanged:")
            
        default:
            return Selector ("touchUpInside:")
        }
    }
    
    @objc func allEditingEvents (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .AllEditingEvents {
                a(c)
            }
        }
    }
    
    @objc func allEvents (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .AllEvents {
                a(c)
            }
        }
    }
    
    @objc func allTouchEvents (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .AllTouchEvents {
                a(c)
            }
        }
    }
    
    @objc func allZeros (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .allZeros {
                a(c)
            }
        }
    }
    
    @objc func applicationReserved (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .ApplicationReserved {
                a(c)
            }
        }
    }
    
    @objc func editingChanged (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .EditingChanged {
                a(c)
            }
        }
    }
    
    @objc func editingDidBegin (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .EditingDidBegin {
                a(c)
            }
        }
    }
    
    @objc func editingDidEnd (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .EditingDidEnd {
                a(c)
            }
        }
    }
    
    @objc func editingDidEndOnExit (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .EditingDidEndOnExit {
                a(c)
            }
        }
    }
    
    @objc func systemReserved (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .SystemReserved {
                a(c)
            }
        }
    }
    
    @objc func touchCancel (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchCancel {
                a(c)
            }
        }
    }
    
    @objc func touchDown (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDown {
                a(c)
            }
        }
    }
    
    @objc func touchDownRepeat (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDownRepeat {
                a(c)
            }
        }
    }
    
    @objc func touchDragEnter (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDragEnter {
                a(c)
            }
        }
    }
    
    @objc func touchDragExit (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDragExit {
                a(c)
            }
        }
    }
    
    @objc func touchDragInside (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDragInside {
                a(c)
            }
        }
    }
    
    @objc func touchDragOutside (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchDragOutside {
                a(c)
            }
        }
    }
    
    @objc func touchUpInside (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchUpInside {
                a(c)
            }
        }
    }
    
    @objc func touchUpOutside (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .TouchUpOutside {
                a(c)
            }
        }
    }
    
    @objc func valueChanged (sender: UIControl) {
        if registeredEvents == nil {
            return
        }
        
        for (e, c, a) in registeredEvents! {
            if sender == c && e == .ValueChanged {
                a(c)
            }
        }
    }
    
}

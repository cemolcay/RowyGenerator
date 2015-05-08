//
//  UIGestureRecognizerHandler.swift
//  RowyGenerator
//
//  Created by Cem Olcay on 08/05/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

typealias UIGestureRecognizerAction = (UIGestureRecognizer) -> Void

class UIGestureRecognizerHandler {

    // MARK: Properties
    
    var registeredGestures: [(UIGestureRecognizer, UIView, UIGestureRecognizerAction)]?
    
    
    // MARK: Singleton
    
    private static let instance = UIGestureRecognizerHandler()
    
    class func sharedInstance () -> UIGestureRecognizerHandler {
        return instance
    }
    
    
    // MARK: Gesture Management
    
    func registerGestureToView (gesture: UIGestureRecognizer, view: UIView, action: UIGestureRecognizerAction) {
        
        if registeredGestures == nil {
            registeredGestures = [(gesture, view, action)]
        } else {
            registeredGestures!.append((gesture, view, action))
        }
        
        gesture.addTarget(self, action: Selector("gestureHandler:"))
        view.addGestureRecognizer(gesture)
    }
    
    func removeGestureFromView (gesture: UIGestureRecognizer, view: UIView) {
        
        if registeredGestures == nil {
            return
        }
        
        var index = 0
        for (g, v, a) in registeredGestures! {
            if g == gesture && v == view {
                registeredGestures!.removeAtIndex(index)
                view.removeGestureRecognizer(gesture)
            }
            
            index++
        }
    }
    
    
    // MARK: Events
    
    @objc func gestureHandler (gesture: UIGestureRecognizer) {
        
        if registeredGestures == nil {
            return
        }
        
        for (g, v, a) in registeredGestures! {
            if g == gesture && v == gesture.view {
                a (g)
            }
        }
    }

}

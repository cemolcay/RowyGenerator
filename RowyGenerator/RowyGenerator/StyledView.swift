//
//  StyledView.swift
//  RowyGenerator
//
//  Created by Cem Olcay on 08/05/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

extension UIView {
    
    func addStyleView (styledView: StyledView) {
        self.addSubview(styledView.view)
    }
}

enum StyledView {
    
    case WhiteTitleLabel (text: String, alignment: NSTextAlignment)
    case GrayTextLabel (frame: CGRect, text: String, alignment: NSTextAlignment)
    case Switch (action: UIControlAction)
    case StandardButton (frame: CGRect, title: String, touchUpInside: UIControlAction)
    case TapView (color: UIColor, tap: UIGestureRecognizerAction)
    
    var view: UIView {
        get {
            switch self {
                
            case .WhiteTitleLabel (let text, let align):
                return UILabel (
                    x: 0,
                    y: 0,
                    attributedText: NSAttributedString(
                        text: text,
                        color: UIColor.whiteColor(),
                        font: UIFont.AvenirNextBold(15)),
                    textAlignment: align)
                
                
            case .GrayTextLabel(let frame, let text, let align):
                return UILabel (
                    x: frame.origin.x,
                    y: frame.origin.y,
                    attributedText: NSAttributedString(
                        text: text,
                        color: UIColor.grayColor(),
                        font: UIFont.AvenirNextRegular(13)),
                    textAlignment: align)
                
                
            case .Switch (let action):
                let sw = UISwitch()
                sw.sizeToFit()
                UIControlEventHandler.sharedInstance().registerEventForControl(.ValueChanged, control: sw, action: action)
                return sw
                
                
            case .StandardButton(let frame, let title, let action):
                let but = UIButton (frame: frame)
                but.setTitle(title, forState: .Normal)
                but.setTitleColor(UIColor.redColor(), forState: .Normal)
                UIControlEventHandler.sharedInstance().registerEventForControl(.TouchUpInside, control: but, action: action)
                return but
                
                
            case .TapView(let color, let action):
                let view = UIView (frame: CGRect(x: 20, y: 50, w: 200, h: 200))
                view.backgroundColor = color
                UIGestureRecognizerHandler.sharedInstance().registerGestureToView(UITapGestureRecognizer(), view: view, action: action)
                return view
                
            }
        }
    }
}

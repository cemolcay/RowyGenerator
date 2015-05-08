//
//  ViewController.swift
//  RowyGenerator
//
//  Created by Cem Olcay on 08/05/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

enum StyledString {
    
    case BoldString (String, UIColor)
    
    func getAttributedString () -> NSAttributedString {
        switch self {
        case .BoldString(let text, let color):
            return NSAttributedString (text: text, color: color, font: UIFont.systemFontOfSize(15))
        }
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addStyleView(
            StyledView.StandardButton(
                frame: CGRect (x: 0, y: 30, w: 150, h: 60),
                title: "styled but",
                touchUpInside: {
                    conrol in
                    println ("touch up inside")
                },
                touchDown: {
                    control in
                    println ("touch down")
                }
            )
        )
    }
}


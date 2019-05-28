//
//  UIViewAutoresizing+Extras.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension provides handy autoresizing options for when
 you are to position a subview in a superview.
 
 */

public extension UIView.AutoresizingMask {
    
    static var centerInParent: UIView.AutoresizingMask {
        return [
            .flexibleTopMargin, .flexibleBottomMargin,
            .flexibleLeftMargin, .flexibleRightMargin
        ]
    }
    
    static var fillInParent: UIView.AutoresizingMask {
        return [.flexibleWidth, .flexibleHeight]
    }
}

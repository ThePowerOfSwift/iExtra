//
//  UIScrollView+PageNumber.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension can be used to get/set the current page of a
 paged UIScrollView.
 
 TODO: Get this from KeyboardKit instead.
 
 */

import UIKit

public extension UIScrollView {
    
    var pageNumber: Int {
        get { return Int(contentOffset.x / frame.size.width) }
        set { contentOffset.x = frame.size.width * CGFloat(newValue) }
    }
}

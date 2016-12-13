//
//  CGRect_Rects.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension CGRect {
    
    public var rectAbove: CGRect {
        return CGRect(x: origin.x, y: origin.y - size.height, width: size.width, height: size.height)
    }
    
    public var rectBelow: CGRect {
        return CGRect(x: origin.x, y: origin.y + size.height, width: size.width, height: size.height)
    }
    
    public var rectLeft: CGRect {
        return CGRect(x: origin.x - size.width, y: origin.y, width: size.width, height: size.height)
    }
    
    public var rectRight: CGRect {
        return CGRect(x: origin.x + size.width, y: origin.y, width: size.width, height: size.height)
    }
}

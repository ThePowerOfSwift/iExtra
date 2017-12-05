//
//  UIView+HitTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func point(inside point: CGPoint, withPadding padding: CGSize, andEvent event: UIEvent?) -> Bool {
        let dx = padding.width
        let dy = padding.height
        let bounds = self.bounds.insetBy(dx: -dx, dy: -dy)
        return bounds.contains(point)
    }
}

//
//  UIView+Rotate.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func rotate(
        withRadians radians: CGFloat,
        duration: TimeInterval,
        options: UIViewAnimationOptions,
        completion: ((_ completed: Bool) -> ())? = nil) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: options,
            animations: { self.transform = self.transform.rotated(by: radians) },
            completion: completion
        )
    }
}

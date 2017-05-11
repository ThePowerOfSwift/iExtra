//
//  UIView_Dock.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public enum UIViewDockPosition { case
    topLeft,
    topRight,
    bottomLeft,
    bottomRight
}


public extension UIView {
    
    public func dock(to position: UIViewDockPosition, padding: CGFloat) {
        switch position {
        case .bottomLeft: dockToBottomLeft(with: padding)
        case .bottomRight: dockToBottomRight(with: padding)
        case .topLeft: dockToTopLeft(with: padding)
        case .topRight: dockToTopRight(with: padding)
        }
    }
}


fileprivate extension UIView {
    
    fileprivate func dockToBottomRight(with padding: CGFloat) {
        let x = superview!.frame.size.width - frame.size.width - padding
        let y = superview!.frame.size.height - frame.size.height - padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    fileprivate func dockToBottomLeft(with padding: CGFloat) {
        let x = padding
        let y = superview!.frame.size.height - frame.size.height - padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    fileprivate func dockToTopLeft(with padding: CGFloat) {
        let x = padding
        let y = padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    fileprivate func dockToTopRight(with padding: CGFloat) {
        let x = superview!.frame.size.width - frame.size.width - padding
        let y = padding
        frame.origin = CGPoint(x: x, y: y)
    }
}

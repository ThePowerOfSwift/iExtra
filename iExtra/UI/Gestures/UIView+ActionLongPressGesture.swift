//
//  UIView+ActionLongPressGesture.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
//  Reference: https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
//

import UIKit

public extension UIView {
    
    public func addLongPressGestureRecognizer(action: (() -> Void)?) {
        longPressAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleLongPress)
        let recognizer = UILongPressGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
}

fileprivate extension UIView {
    
    typealias Action = (() -> Void)
    
    struct Key { static var id = "longPressAction" }
    
    var longPressAction: Action? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? Action
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        longPressAction?()
    }
}

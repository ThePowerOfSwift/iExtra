//
//  UIView+ActionLongPressGesture.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-12.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//
//  Reference: https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
//

/*
 
 This extension applies long press gesture recognizers using
 action blocks instead of the target/selector pattern.
 
 */

import UIKit

public extension UIView {
    
    typealias LongPressAction = (() -> Void)
    
    func addLongPressAction(action: LongPressAction?) {
        longPressAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleLongPress)
        let recognizer = UILongPressGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
    
    func removeLongPressAction() {
        guard let gestures = gestureRecognizers else { return }
        let longPresses = gestures.filter { $0 is UILongPressGestureRecognizer }
        longPresses.forEach { removeGestureRecognizer($0) }
    }
}

private extension UIView {
    
    struct Key { static var id = "longPressAction" }
    
    var longPressAction: LongPressAction? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? LongPressAction
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

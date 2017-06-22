//
//  UIViewController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func alert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: buttonText, style: .cancel)
        alert.addAction(button)
        present(alert, animated: true, completion: nil)
    }
    
    func alert(title: String, message: String, cancelText: String? = nil, actionText: String, action: (() -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelText = cancelText {
            let cancelButton = UIAlertAction(title: cancelText, style: .cancel)
            alert.addAction(cancelButton)
        }
        
        let actionButton = UIAlertAction(title: actionText, style: .default, handler: { (_) in action?() })
        alert.addAction(actionButton)
        
        present(alert, animated: true, completion: nil)
    }
}

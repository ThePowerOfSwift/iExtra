//
//  UIViewController+StatusBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-22.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    
    // MARK: - Properties
    
    public var statusBarStyle: UIStatusBarStyle {
        get { return app.statusBarStyle }
        set { app.statusBarStyle = newValue }
    }
    
    fileprivate var app: UIApplication {
        return UIApplication.shared
    }
}

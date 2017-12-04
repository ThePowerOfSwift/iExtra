//
//  ParallaxEffect.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-19.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol ParallaxEffect {
    
    func addParallaxEffect(to view:UIView, maxOffset: Int)
    func removeParallaxEffect(from view:UIView)
}

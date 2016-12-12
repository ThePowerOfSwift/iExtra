//
//  UIViewController_StatusBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-22.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UISlider {
    
    
    // MARK: - Properties
    
    public var buttonPosition: CGFloat {
        return CGFloat(valuePercentage) * bounds.size.width
    }
    
    public var buttonSize: CGFloat {
        guard let image = thumbImage(for: .normal) else { return frame.height }
        return image.size.width
    }
    
    public var valuePercentage: Float {
        return (value - minimumValue) / (maximumValue - minimumValue)
    }
    
    
    
    // MARK: - Public Functions
    
    public func percentage(at point: CGPoint) -> Float {
        let x = point.x
        let width = bounds.width
        let result = x / width
        return Float(result)
    }
    
    public func value(at point: CGPoint) -> Float {
        let percentage = self.percentage(at: point)
        let valueSpan = maximumValue - minimumValue
        let value = minimumValue + percentage * valueSpan
        return value
    }
}

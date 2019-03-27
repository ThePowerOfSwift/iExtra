//
//  DateDate+Adding.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

//  TODO: Write unit tests for all these extensions

import Foundation

public extension Date {
    
    func adding(days: Int) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    func adding(hours: Int) -> Date {
        let seconds = Double(hours) * 60 * 60
        return addingTimeInterval(seconds)
    }
    
    func adding(minutes: Int) -> Date {
        let seconds = Double(minutes) * 60
        return addingTimeInterval(seconds)
    }
    
    func adding(seconds: Int) -> Date {
        return addingTimeInterval(Double(seconds))
    }
}

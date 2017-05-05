//
//  DateSerializerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-29.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public class DateSerializerDefault: NSObject, DateSerializer {
    
    
    // MARK: Public methods
    
    public func deserialize(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = getDateFormat(for: string).string
        return formatter.date(from: string)
    }
    
    public func serialize(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}



// MARK: Private methods

fileprivate extension DateSerializerDefault {
    
    func getDateFormat(for string: String) -> DateSerializerFormat {
        let hasFragments = string.range(of: ".") != nil
        return hasFragments ? .dateTimeWithFragments : .dateTime
    }
}

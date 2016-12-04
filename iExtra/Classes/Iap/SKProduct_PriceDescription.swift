//
//  SKProductPriceDescription.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-03.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import StoreKit

public extension SKProduct {
    
    public var priceDescription: String {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price) ?? "N/A"
    }
}

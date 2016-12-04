//
//  KeychainWriter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol KeychainWriter: class {

    @discardableResult
    func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    func removeAllKeys() -> Bool
    
    @discardableResult
    func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    
    @discardableResult
    func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
}

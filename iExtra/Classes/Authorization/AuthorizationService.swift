//
//  AuthorizationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol AuthorizationService: class {
    func authorize(action: String, reason: String, completion: @escaping (_ success: Bool) -> ())
    func canAuthorize(action: String) -> Bool
    func isAuthorized(forAction action: String) -> Bool
    func resetAuthorization(forAction action: String)
}

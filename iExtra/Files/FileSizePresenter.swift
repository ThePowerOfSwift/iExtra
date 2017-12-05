//
//  FileSizePresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol FileSizePresenter: class {
    
    func fileSizeDescription(for fileSize: UInt64) -> String
}

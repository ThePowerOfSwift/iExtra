//
//  IntrinsicTableView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-31.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class IntrinsicTableView: UITableView {
    
    public override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}

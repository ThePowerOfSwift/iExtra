//
//  StretchableScrollViewHeader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-06.
//  Copyright (c) 2017 Daniel Saidi. All rights reserved.
//

/*
 
 When this view is used as a scroll view header, it will
 stretch out when the user pulls down on the scroll view,
 then scroll away as the user scrolls in the scroll view.
 
 This view must not be placed in the scroll view that it
 will be the header of. Instead, place it under (z-index)
 the scroll view and align their top and width.
 
 Once everything is setup, simply call `handleScroll(in:)`
 in `scrollViewDidScroll(:)` to make the view handle the
 scroll event. If you are using auto layout to determine
 the height of the view, make sure to set the constraint
 parameter as well, otherwise any height changes will be
 applied to the frame instead of the constraint.
 
 If you want a parallax effect when you scroll, just set
 the `parallaxFactor` property to a value greater than 0.
 The higher the value, the slower the header scrolls.
 
 */

import UIKit


open class StretchableScrollViewHeader: UIView {
    
    
    // MARK: - View Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        guard let scrollView = scrollView else { return }
        handleScroll(in: scrollView)
        //handleAutoSizing()
    }
    
    
    
    // MARK: - Properties
    
    public fileprivate(set) var baseHeight: CGFloat!
    
    public var displayHeight: CGFloat {
        guard let view = scrollView else { return frame.size.height }
        return max(0, -view.contentOffset.y)
    }
    
    public var displayHeightFactor: CGFloat {
        guard let view = scrollView else { return 1 }
        return displayHeight / baseHeight
    }
    
    public var isSetup: Bool {
        return baseHeight != nil
    }
    
    public var isStretching: Bool {
        guard let view = scrollView else { return false }
        return view.contentOffset.y < -baseHeight
    }
    
    public var parallaxFactor: CGFloat = 0
    
    
    
    // MARK: - Properties

    fileprivate weak var scrollView: UIScrollView?
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView, usingHeightConstraint constraint: NSLayoutConstraint? = nil) {
        setup(with: scrollView)
        guard isSetup else { return }
        updateHeight(for: scrollView, usingHeightConstraint: constraint)
        updateOffset(for: scrollView)
    }
    
    public func setup(with scrollView: UIScrollView) {
        guard scrollView != self.scrollView else { return }
        self.scrollView = scrollView
        updateBaseHeight()
        handleScroll(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableScrollViewHeader {
    
    func updateBaseHeight() {
        let height = frame.size.height
        guard baseHeight != height else { return }
        baseHeight = height
        scrollView?.contentOffset = CGPoint(x: 0, y: -height)
        scrollView?.contentInset.top = height
    }
    
    func updateHeight(for scrollView: UIScrollView, usingHeightConstraint constraint: NSLayoutConstraint? = nil) {
        guard isStretching else { return }
        let newHeight = -scrollView.contentOffset.y
        if let constraint = constraint {
            constraint.constant = newHeight
        } else {
            frame.size.height = newHeight
        }
    }
    
    func updateOffset(for scrollView: UIScrollView) {
        guard !isStretching else { return }
        let parallaxFactor = max(0, self.parallaxFactor + 1)
        let offset = -scrollView.contentOffset.y - baseHeight
        frame.origin.y = offset / parallaxFactor
    }
}

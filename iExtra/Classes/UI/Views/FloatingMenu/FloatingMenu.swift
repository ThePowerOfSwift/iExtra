//
//  FloatingMenu.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-11.
//  Copyright (c) 2014 Daniel Saidi. All rights reserved.
//

import UIKit

open class FloatingMenu: UIView {
    
    
    // MARK: - Setup
    
    open func setup(primaryButton: UIButton, submenus: [FloatingSubmenu]) {
        removeAllSubviews()
        setup(primaryButton: primaryButton)
        setup(submenus: submenus)
    }
    
    private func setup(primaryButton button: UIButton) {
        addSubview(button)
        let size = button.frame.size
        let action = #selector(primaryButtonTapped)
        button.frame = CGRect(origin: CGPoint.zero, size: size)
        button.addTarget(self, action: action, for: .touchDown)
        primaryButton = button
        setupShadow(for: button)
    }
    
    private func setup(submenus: [FloatingSubmenu]) {
        self.submenus = submenus
        var lastView = primaryButton
        for submenu in submenus {
            for button in submenu.buttons {
                insertSubview(button, belowSubview:lastView!)
                let action = #selector(submenuButtonTapped)
                button.center = primaryButton.center
                button.addTarget(self, action: action, for: .touchUpInside)
                lastView = button
                setupShadow(for: button)
            }
        }
    }
    
    private func setupShadow(for button: UIButton) {
        button.layer.shadowColor = shadowColor.cgColor
        button.layer.shadowOffset = shadowOffset
        button.layer.shadowRadius = CGFloat(shadowRadius)
        button.layer.shadowOpacity = shadowOpacity
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    
    
    // MARK: - Dependencies
    
    open var menuPresenter = SlowPulsingFloatingMenuPresenter()
    open var backgroundPresenter = RadialFloatingMenuBackgroundPresenter()
    open var buttonPresenter = LinearFloatingSubMenuPresenter(direction:.right)
    
    
    
    // MARK: - Properties
    
    open var isClosed: Bool { return !isOpen }
    open var isOpen: Bool { return primaryButton.isSelected }
    open var shadowColor = UIColor.black
    open var shadowOpacity = Float(0.5)
    open var shadowOffset = CGSize(width: 1, height: 1)
    open var shadowRadius = 1.0
    
    public private(set) var primaryButton: UIButton!
    public private(set) var submenus = [FloatingSubmenu]()
    
    
    
    // MARK: - Custom hit test
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var hitViews = Array<UIView>()
        hitViews.append(primaryButton)
        for submenu in submenus {
            hitViews.append(contentsOf: submenu.buttons as [UIView])
        }
        hitViews.append(contentsOf: subviews)

        for view in hitViews {
            if view.frame.contains(point) {
                return view
            }
        }
        return super.hitTest(point, with: event)
    }
    
    
    
    // MARK: - Public methods
    
    open func close() {
        guard isOpen else { return }
        primaryButton.isEnabled = false
        primaryButton.isSelected = false
        for submenu in submenus {
            submenu.handleMenuDidClose(self)
        }
        backgroundPresenter.hideBackground(for: self)
        delay (0.2) { self.primaryButton.isEnabled = true }
    }
    
    open func open() {
        guard isClosed else { return }
        primaryButton.isEnabled = false
        primaryButton.isSelected = true
        for submenu in submenus {
            submenu.handleMenuDidOpen(self)
        }
        backgroundPresenter.presentBackground(for: self)
        delay (0.2) { self.primaryButton.isEnabled = true }
    }
    
    open func present() {
        primaryButton.isEnabled = false
        menuPresenter.present(menu: self) {
            self.primaryButton.isEnabled = true
            for submenu in self.submenus {
                submenu.handleMenuDidPresent(self)
            }
        }
    }
    
    open func toggle() {
        isOpen ? close() : open()
    }
}


//MARK: - Selectors

@objc extension FloatingMenu {
    
    func primaryButtonTapped() {
        toggle()
    }
    
    func submenuButtonTapped() {
        close()
    }
}



//MARK: - Private methods

fileprivate extension FloatingMenu {
    
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}

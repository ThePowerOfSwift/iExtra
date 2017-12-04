//
//  FloatingSubmenu.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-22.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public enum FloatingSubmenuDisplayMode {
    case visibleWhenMainMenuIsClosed
    case visibleWhenMainMenuIsOpen
}

open class FloatingSubmenu: UIView {
    
    
    // MARK: - Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(buttons:[UIButton], presenter: FloatingSubmenuPresenter) {
        super.init(frame:CGRect.zero)
        self.buttons = buttons
        self.presenter = presenter
    }
    
    
    
    // MARK: - Properties
    
    open var buttons = [UIButton]()
    open var displayMode = FloatingSubmenuDisplayMode.visibleWhenMainMenuIsOpen
    open var presenter: FloatingSubmenuPresenter?
    
    
    
    // MARK: - Public Functions
    
    open func handleMenuDidClose(_ menu: FloatingMenu) {
        handleMenuDidChangeState(menu)
    }
    
    open func handleMenuDidOpen(_ menu: FloatingMenu) {
        handleMenuDidChangeState(menu)
    }
    
    open func handleMenuDidPresent(_ menu: FloatingMenu) {
        handleMenuDidChangeState(menu)
    }
    
    
    private func handleMenuDidChangeState(_ menu: FloatingMenu) {
        guard let presenter = presenter else { return }
        
        let presentForOpen = menu.isOpen && displayMode == .visibleWhenMainMenuIsOpen
        let presentForClosed = menu.isClosed && displayMode == .visibleWhenMainMenuIsClosed
        if (presentForOpen || presentForClosed) {
            presenter.present(submenu: self, in: menu)
        } else {
            presenter.dismiss(submenu: self, in: menu)
        }
    }
}

//
//  UIView+LayoutContraint.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Create constraints for multiple views
extension UIView {
    func allignToLeft(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func allignToRight(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func allignToTop(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func allignToBottom(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func stickToView(view: UIView, padding: UIEdgeInsets = UIEdgeInsets.zero) {
        allignToLeft(view: view, padding: padding.left)
        allignToRight(view: view, padding: padding.right)
        allignToTop(view: view, padding: padding.top)
        allignToBottom(view: view, padding: padding.bottom)
    }
}


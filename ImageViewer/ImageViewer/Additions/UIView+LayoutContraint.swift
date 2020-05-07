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
    func alignToLeft(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func alignToRight(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func alignToTop(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func alignToBottom(view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func alignBottom(toTopView view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: -padding).isActive = true
    }
    
    func stickToView(view: UIView, padding: UIEdgeInsets = UIEdgeInsets.zero) {
        alignToLeft(view: view, padding: padding.left)
        alignToRight(view: view, padding: padding.right)
        alignToTop(view: view, padding: padding.top)
        alignToBottom(view: view, padding: padding.bottom)
    }
    
    func centerXtoView(view: UIView) {
         NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    func centerYtoView(view: UIView) {
         NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    func centerToView(view: UIView) {
        centerXtoView(view: view)
        centerYtoView(view: view)
    }
}


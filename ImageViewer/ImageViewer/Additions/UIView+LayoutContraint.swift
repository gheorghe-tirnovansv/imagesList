//
//  UIView+LayoutContraint.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Foundation
import UIKit

/**
This extension offers support to add layout constraints in a quickly manner
*/
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
    
    func alignBottom(toTopOf view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: padding).isActive = true
    }
    
    func alignBottom(toTopView view: UIView, padding: CGFloat = 0.0) {
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: -padding).isActive = true
    }
    
    func embedToView(view: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        alignToLeft(view: view, padding: insets.left)
        alignToRight(view: view, padding: insets.right)
        alignToTop(view: view, padding: insets.top)
        alignBottom(toTopOf: view, padding: insets.bottom)
    }
    
    func centerX(to view: UIView) {
         NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    func centerY(to view: UIView) {
         NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    func centerToView(view: UIView) {
        centerX(to: view)
        centerY(to: view)
    }
}


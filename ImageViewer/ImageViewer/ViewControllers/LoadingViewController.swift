//
//  LoadingViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

/**
 Screen which displays loading state
*/
class LoadingViewController: UIViewController {
    private var activityView = UIActivityIndicatorView()
    private var messageLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.style = .gray
        view.addSubview(activityView)
        activityView.centerToView(view: view)
        activityView.startAnimating()
        
        view.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "Please wait until you data is loaded..."
        messageLabel.textAlignment = .center
        messageLabel.alignToLeft(view: view)
        messageLabel.alignToRight(view: view)
        messageLabel.alignBottom(toTopView: activityView, padding: 20)
    }
}

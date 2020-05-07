//
//  LoadingViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    private var activityView = UIActivityIndicatorView()
    private var messageLabel = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.color = .black
        activityView.style = .gray
        
        view.addSubview(activityView)
        activityView.centerToView(view: view)
        view.backgroundColor = .white
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

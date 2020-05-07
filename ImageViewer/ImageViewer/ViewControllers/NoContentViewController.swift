//
//  NoContentViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

/**
 Screen which displays empty state or error state
*/
class NoContentViewController: UIViewController {
    private let descriptionLabel = UILabel()
    
    var viewModel: NoContentViewModel? {
        didSet {
            descriptionLabel.text = viewModel?.errorContextDescription ?? NoContentViewModel.defaultMessage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = viewModel?.errorContextDescription ?? NoContentViewModel.defaultMessage
        descriptionLabel.centerX(to: view)
        descriptionLabel.alignToLeft(view: view)
        descriptionLabel.alignToRight(view: view)
    }
}

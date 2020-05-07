//
//  NoContentViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class NoContentViewController: UIViewController {
    private let descriptionLabel = UILabel()
    
    var viewModel: NoContentViewModel? {
        didSet {
            descriptionLabel.text = viewModel?.errorContextDescription ?? NoContentViewModel.defaultMessage
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        descriptionLabel.centerYtoView(view: view)
        descriptionLabel.alignToLeft(view: view)
        descriptionLabel.alignToRight(view: view)
    }
}

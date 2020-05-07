//
//  MainViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/6/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    enum ControllerState {
        case loading, emptyContent, fullContent(content:FactsModel)
    }
    
    private var currentViewController: UIViewController = LoadingViewController()
    private let loadingViewController = LoadingViewController()
    private let emptyViewController = EmptyViewController()
    private let contentViewController = ContentViewController()
    
    var currentState: ControllerState {
        didSet {
            switch currentState {
            case .loading:
                self.title = "Loading content..."
                showController(loadingViewController)
            case .emptyContent:
                self.title = ""
                showController(emptyViewController)
            case .fullContent:
                self.title = "Needs to be updated"
                showController(contentViewController)
            }
        }
    }
    
    init() {
        currentState = .loading
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentState = .loading
        NetworkingHandler.fetchContent { [weak self] response in
            switch response {
            case .success(let factsModel):
                self?.currentState = .fullContent(content: factsModel)
            case .failure(_):
                self?.currentState = .emptyContent
            }
        }
    }
    
    func showController(_ new: UIViewController) {
        currentViewController.removeFromParent()
        currentViewController.view.removeFromSuperview()
        
        currentViewController = new
        self.view.addSubview(currentViewController.view)
        self.addChild(currentViewController)
        self.view.stickToView(view: currentViewController.view)
    }
}

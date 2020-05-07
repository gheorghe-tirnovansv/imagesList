//
//  MainViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/6/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

/**
 The root screen responsible to display states: laoding, full content or empty content
*/
class MainViewController: UIViewController {

    enum ControllerState {
        case loading, noContent(context: NetworkingErrorContext), fullContent(content: FactsModel)
    }
    
    private var currentViewController: UIViewController = LoadingViewController()
    private let loadingViewController = LoadingViewController()
    private let noContentViewController = NoContentViewController()
    private let contentViewController = ContentViewController()
    
    var currentState: ControllerState {
        didSet {
            switch currentState {
            case .loading:
                self.title = "Loading content..."
                showController(loadingViewController)
            case .noContent(let context):
                let viewModel = NoContentViewModel(with:context)
                self.title = viewModel.title
                noContentViewController.viewModel = viewModel
                showController(noContentViewController)
            case .fullContent(let content):
                let viewModel = FactsViewModel(with: content){ [weak self] in
                    self?.loadContent()
                }
                self.title = viewModel.title
                contentViewController.viewModel = viewModel
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
        loadContent()
    }
    
    private func loadContent() {
        NetworkingHandler.fetchContent { [weak self] response in
            switch response {
            case .success(let factsModel):
                self?.currentState = .fullContent(content: factsModel)
            case .failure(let errorContext):
                self?.currentState = .noContent(context: errorContext)
            }
        }
    }
    
    private func showController(_ new: UIViewController) {
        guard new != currentViewController else {
            //current view controller is already displayed
            return
        }
        currentViewController.removeFromParent()
        currentViewController.view.removeFromSuperview()
        
        currentViewController = new
        self.view.addSubview(currentViewController.view)
        self.addChild(currentViewController)
        currentViewController.didMove(toParent: self)
        self.view.embedToView(view: currentViewController.view)
    }
}

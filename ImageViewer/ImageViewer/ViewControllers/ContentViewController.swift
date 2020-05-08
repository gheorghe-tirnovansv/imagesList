//
//  ContentViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

/**
 Screen which all facts
*/
class ContentViewController: UIViewController {
    private let cellIdentifier = "rowIdentifier"
    private var collectionView: UICollectionView?
    private let refreshControl = UIRefreshControl()
    
    var viewModel: FactsViewModel? {
        didSet {
            updateContent()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize (width: RowCollectionViewCell.defaultImageWidth,
                                           height: RowCollectionViewCell.defaultImageWidth)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.embedToView(view: view)
        collectionView.dataSource = self
        collectionView.register(RowCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .white
        self.collectionView = collectionView
        
        // Configure Refresh Control
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    }
    
    private func updateContent() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        collectionView?.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {[weak self] in
            self?.collectionView?.performBatchUpdates(nil, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateContent()
    }
    
    @objc private func fetchData() {
        viewModel?.refreshAction()
    }
}

extension ContentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        if let viewModel = viewModel,
            let cell = cell as? RowCollectionViewCell {
            cell.updateContent(model: viewModel.rows[indexPath.item])
        }
        return cell
    }
}

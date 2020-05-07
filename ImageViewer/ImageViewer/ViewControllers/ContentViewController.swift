//
//  ContentViewController.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    private let cellIdentifier = "rowIdentifier"
    private var collectionView: UICollectionView?
    
    var viewModel: FactsViewModel? {
        didSet {
            updateContent()
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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize (width: RowCollectionViewCell.defaultImageWidth,
                                           height: RowCollectionViewCell.defaultImageWidth)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.stickToView(view: view)
        collectionView.dataSource = self
        collectionView.register(RowCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = .white
        self.collectionView = collectionView
        collectionView.reloadData()
    }
    
    func updateContent() {
        collectionView?.reloadData()
        collectionView?.collectionViewLayout.invalidateLayout()
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

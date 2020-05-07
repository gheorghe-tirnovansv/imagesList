//
//  RowCollectionViewCell.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit
import SDWebImage

/**
 Class which implements layout of cells displayed on the main screen
*/
class RowCollectionViewCell: UICollectionViewCell {
    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var widthConstraint: NSLayoutConstraint? = nil
    private var heightConstraint: NSLayoutConstraint? = nil
    static let defaultImageHight: CGFloat = 300.0
    static let defaultImageWidth: CGFloat = 300.0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        widthConstraint?.constant = RowCollectionViewCell.defaultImageWidth
        heightConstraint?.constant = RowCollectionViewCell.defaultImageHight
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
    
    func setupUI() {
        contentView.backgroundColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    
        imageView.alignToTop(view: contentView)
        imageView.alignToRight(view: contentView)
        imageView.alignToLeft(view: contentView)
        imageView.alignBottom(toTopView: titleLabel)
        self.widthConstraint = NSLayoutConstraint(item: imageView,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: RowCollectionViewCell.defaultImageWidth)
        self.widthConstraint?.isActive = true
        self.heightConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: RowCollectionViewCell.defaultImageHight)
        self.heightConstraint?.isActive = true
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.alignToLeft(view: contentView)
        titleLabel.alignToRight(view: contentView)
        titleLabel.alignBottom(toTopView: descriptionLabel)
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.alignBottom(toTopOf: contentView)
        descriptionLabel.alignToLeft(view: contentView)
        descriptionLabel.alignToRight(view: contentView)
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func updateContent(model: RowModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        let url = URL(string:  model.imageHref ?? "")
        imageView.sd_setImage(with: url,
                              placeholderImage: UIImage(named: "placeholderImage"),
                              progress: nil) {[weak self] (image, error, type, url) in
                                guard let self = self else { return }
                                self.widthConstraint?.constant = self.imageView.image?.size.width ?? RowCollectionViewCell.defaultImageWidth
                                self.heightConstraint?.constant = self.imageView.image?.size.height ?? RowCollectionViewCell.defaultImageHight
        }
    }
}

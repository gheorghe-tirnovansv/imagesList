//
//  FactsViewModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class FactsViewModel: NSObject {
    private(set) var title = ""
    private var factsModel: FactsModel
    private(set) var rows: [RowModel]
    
    init(with factsModel: FactsModel) {
        title = factsModel.title
        self.factsModel = factsModel
        rows = factsModel.rows.filter { $0.hasValidContent() }
        super.init()
    }
}

private extension RowModel {
    func hasValidContent() -> Bool {
        let unwrappedTitle = title ?? ""
        let unwrappedDescription = description ?? ""
        let unwrappedImageHref = imageHref ?? ""
        return !(unwrappedTitle.isEmpty && unwrappedDescription.isEmpty && unwrappedImageHref.isEmpty)
    }
}

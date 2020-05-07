//
//  FactsViewModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//
import Foundation

/**
 Class designed to handle information displayed on the main screen
*/
class FactsViewModel: NSObject {
    private(set) var title = ""
    private(set) var rows: [RowModel]
    private(set) var refreshAction: (() -> Void)
    
    private var factsModel: FactsModel
    
    init(with factsModel: FactsModel, refreshAction:@escaping () -> Void) {
        title = factsModel.title
        self.factsModel = factsModel
        self.refreshAction = refreshAction
        rows = factsModel.rows.filter { $0.hasValidContent() }
        super.init()
    }
}

private extension RowModel {
    func hasValidContent() -> Bool {
        let titleIsInvalid = title?.isEmpty ?? true
        let descriptionIsInvalid = description?.isEmpty ?? true
        let imageHrefIsInvalid = imageHref?.isEmpty ?? true
        return !(titleIsInvalid && descriptionIsInvalid && imageHrefIsInvalid)
    }
}

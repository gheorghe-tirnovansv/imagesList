//
//  FactsModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Foundation

struct FactsModel: Codable {
    var title: String
    var rows: [RowModel]
}

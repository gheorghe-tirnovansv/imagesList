//
//  FactsModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Foundation

/**
 Facts model struct used to display main screen content
*/
struct FactsModel: Codable {
    var title: String
    var rows: [RowModel]
}


extension FactsModel : Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title && lhs.rows == rhs.rows
    }
}

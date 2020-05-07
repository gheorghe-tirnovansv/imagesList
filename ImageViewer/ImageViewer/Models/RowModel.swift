//
//  RowModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Foundation

struct RowModel: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}

extension RowModel : Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.imageHref == rhs.imageHref
    }
}

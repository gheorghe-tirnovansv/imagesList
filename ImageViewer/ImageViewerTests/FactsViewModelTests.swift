//
//  FactsViewModelTests.swift
//  ImageViewerTests
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import XCTest
@testable import ImageViewer

class FactsViewModelTests: XCTestCase {
    
    func test_title_returns_correctValue() {
        let expectedString = "Title for testing"
        let expectedValue = FactsModel(title: expectedString, rows: [])
        let viewModel = FactsViewModel(with: expectedValue) { }
        XCTAssertEqual(viewModel.title, expectedString, "title returned \(expectedString) is not correct")
    }
    
    func test_rows_returns_3_valid_rows() {
        let row1 = RowModel(title: "test 1", description: "test 1", imageHref: "test 1")
        let row2 = RowModel(title: "test 2", description: "test 2", imageHref: "test 2")
        let row3 = RowModel(title: "test 3", description: "test 3", imageHref: "test 3")
        let expectedValue = FactsModel(title: "", rows: [row1, row2, row3])
        let viewModel = FactsViewModel(with: expectedValue) { }
        XCTAssertEqual(viewModel.rows, [row1, row2, row3], "All rows should be returned")
    }
    
    func test_rows_returs_2_valid_rows() {
        let row1 = RowModel(title: "test 1", description: "test 1", imageHref: "test 1")
        let row2 = RowModel(title: "test 2", description: "test 2", imageHref: "test 2")
        let row3 = RowModel(title: "", description: "", imageHref: "")
        let expectedValue = FactsModel(title: "", rows: [row1, row2, row3])
        let viewModel = FactsViewModel(with: expectedValue) { }
        XCTAssertEqual(viewModel.rows, [row1, row2], "Should be returned only two rows")
    }
}

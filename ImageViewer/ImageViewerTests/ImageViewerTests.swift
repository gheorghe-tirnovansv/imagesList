//
//  ImageViewerTests.swift
//  ImageViewerTests
//
//  Created by gheorghe.tirnovan on 5/6/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import XCTest
@testable import ImageViewer

class NoContentViewModelTests: XCTestCase {
    
    func test_errorContextDescription_whenURL_isInvalid() {
        let expectedString = "Content could not be loaded due to some issues with URL."
        let viewModel =  NoContentViewModel(with:NetworkingErrorContext.invalidUrl)
        XCTAssertEqual(viewModel.errorContextDescription, expectedString, "String returned is invalid")
    }
    
    func test_defaultMessage_returns_corectValue() {
        let expectedString = "Unfortunatelly content could not be loaded"
        XCTAssertEqual(NoContentViewModel.defaultMessage, expectedString, "String returned is invalid")
    }
}


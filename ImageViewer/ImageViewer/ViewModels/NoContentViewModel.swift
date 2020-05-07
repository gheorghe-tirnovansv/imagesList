//
//  NoContentViewModel.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

class NoContentViewModel: NSObject {
    private(set) var errorContextDescription = ""
    private(set) var title = "Error"
    static let defaultMessage = "Unfortunatelly content could not be loaded"
    
    init(with errorContext: NetworkingErrorContext) {
        super.init()
        errorContextDescription = computeMessages(errorContext: errorContext)
    }
    
    private func computeMessages(errorContext: NetworkingErrorContext) -> String {
        enum NetworkingErrorContext: Error {
            case invalidUrl
            case invalidResponse(error: Error)
            case serverError(error: Error)
        }
        
        switch errorContext {
        case .invalidUrl:
            return "Content could not be loaded due to some issues with URL."
        case .invalidResponse(let error):
            return "Content could not be loaded. We encountered the following error: \(error.localizedDescription)"
        case .serverError(let error):
            return "Content could not be loaded due to server issues. We encountered the following error: \(error.localizedDescription)"
        }
    }
}

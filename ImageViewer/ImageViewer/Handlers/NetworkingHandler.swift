//
//  NetworkingHandler.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Alamofire
import SwiftyJSON

/**
 Enum designed to reflect error request response states
*/

enum NetworkingErrorContext: Error {
    // error returned when URL was invalid
    case invalidUrl
    // error returned when responsed coudn't be decodec
    case invalidResponse(error: Error)
    // error returned when server returns an error
    case serverError(error: Error)
}

/**
 Class designed to offer support for networking handling.
*/
class NetworkingHandler: NSObject {
    
    private static let urlString  = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    static func fetchContent(completion:@escaping (Result<FactsModel, NetworkingErrorContext>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        AF.request(url, encoding: URLEncoding.default).responseString { response in
            switch response.result {
            case .success(let string):
                let swiftyJsonVar = JSON(parseJSON: string)
                let decoder = JSONDecoder()
                do {
                    let jsonData = try swiftyJsonVar.rawData(options: .fragmentsAllowed)
                    let content = try decoder.decode(FactsModel.self, from: jsonData)
                    completion(.success(content))
                } catch {
                    completion(.failure(.invalidResponse(error: error)))
                }
                
            case .failure(let error):
                completion(.failure(.serverError(error: error)))
            }
        }
    }
}

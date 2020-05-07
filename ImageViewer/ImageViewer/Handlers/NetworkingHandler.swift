//
//  NetworkingHandler.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/7/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum NetworkingError: Error {
    case invalidUrl
    case invalidResponse(error: Error)
    case serverError(error: Error)
}

class NetworkingHandler: NSObject {
    
    private static let urlString  = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    static func fetchContent(completion:@escaping (Result<FactsModel, NetworkingError>) -> Void) {
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

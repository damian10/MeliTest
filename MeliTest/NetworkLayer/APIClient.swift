//
//  APIClient.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import Foundation

class APIClient {
    
    var requestBuilder:RequestBuilder?
    
    init(requestBuilder:RequestBuilder) {
        self.requestBuilder = requestBuilder
    }
    func request(router: Router, completion: @escaping (Result<[String:Any], Error>) -> ()) {
        
        guard let request = self.requestBuilder?.build(router: router) else {
            return
        }
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        do {
                            let jsonReponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                            guard let dict = jsonReponse else {
                                completion(.failure(APIError.invalidRequest))
                                return
                            }
                            completion(.success(dict))
                        } catch {
                            completion(.failure(APIError.jsonParsingError(error: error)))
                        }
                    } else {
                        completion(.failure(APIError.dataLoadingError(statusCode: response.statusCode, data: data)))
                    }
                } else {
                    completion(.failure(APIError.invalidRequest))
                }
            } else {
                completion(.failure(APIError.invalidRequest))
            }
        }
        dataTask.resume()
    }
}

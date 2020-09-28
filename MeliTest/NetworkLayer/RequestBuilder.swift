//
//  RequestBuilder.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/28/20.
//

import Foundation

class RequestBuilder {
    
    func build(router:Router) -> URLRequest? {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        return urlRequest
    }
    
}

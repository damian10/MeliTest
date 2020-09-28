//
//  Router.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import Foundation

enum Router {
    case getProducts(name:String)
    
    var scheme: String {
        switch self {
        case .getProducts:
          return "https"
        }
    }
      
    var host: String {
        switch self {
            case .getProducts:
                return "api.mercadolibre.com"
        }
    }
    
    var path: String {
        switch self {
            case .getProducts:
                return "/sites/MLA/search"
        }
    }
    
    var parameters: [URLQueryItem] {
        
        switch self {
        case .getProducts(let name):
                return [URLQueryItem(name: "q", value: name)]
        }
        
    }
        
    var method: String {
        switch self {
            case .getProducts:
                return "GET"
        }
    }
}
    


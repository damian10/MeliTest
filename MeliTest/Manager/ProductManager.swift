//
//  ProductManager.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import Foundation

protocol ProductManagerDelegate: class {
    func productsLoaded(products:Products)
    func productsLoadFailed()
}

class ProductManager {
    
    weak var delegate:ProductManagerDelegate?
    var apiClient:APIClient?
    var isLoading = false
    
    init(delegate:ProductManagerDelegate, apiClient:APIClient) {
        self.delegate = delegate
        self.apiClient = apiClient
    }
    
    func setDelegate(delegate:ProductManagerDelegate) {
        self.delegate = delegate
    }
    
    func getProducts(name:String) {
        apiClient?.request(router: Router.getProducts(name: name)) { [weak self] (result: Result<[String:Any], Error>)  in
            switch result {
                case .success(let products):
                    guard let safeProducts = self?.decodeProducts(data: products) else {
                        return
                    }
                    
                    self?.delegate?.productsLoaded(products: safeProducts)
                case .failure(_):
                    self?.delegate?.productsLoadFailed()
            }
        }
    }
    
    func decodeProducts(data:[String:Any]) -> Products? {
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: data,
            options: []) {
            let theJSONText = String(data: theJSONData,
                                       encoding: .ascii)
            print("JSON string = \(theJSONText!)")
            
            guard let products = Products(jsonString: theJSONText ?? "") else {
                return nil
            }
            
            return products
        }
        return nil
    }
}

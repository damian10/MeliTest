//
//  Product.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import Foundation

struct Products: Decodable {
    let items: [Product]?
    enum CodingKeys: String, CodingKey {
        case items = "results"
    }
}

struct Product: Decodable, Encodable {
    let id: String?
    let title: String?
    let price: Double?
    let thumbnail: String?
    let condition: String?
    let shipping: Shipping
}

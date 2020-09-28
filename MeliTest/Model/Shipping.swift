//
//  Shipping.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/26/20.
//

import Foundation

struct Shipping: Decodable, Encodable {
    let freeShipping: Bool?
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
}

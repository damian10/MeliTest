//
//  String+Json.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/27/20.
//

import Foundation

public extension String {
    static func json(fromFile: String, bundle: Bundle) -> String {
        let data = Data(jsonFileName: fromFile, bundle: bundle)
        return String(decoding: data, as: UTF8.self)
    }
}

//
//  Decodable+Json.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/24/20.
//

import Foundation

import Foundation

public extension Decodable {
    private static var customDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }

        do {
            self = try Self.customDecoder.decode(Self.self, from: data)
        } catch {
            debugPrint("Decodable error \(error)")
            return nil
        }
    }
}

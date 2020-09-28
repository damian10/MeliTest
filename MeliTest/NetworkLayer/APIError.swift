//
//  APIError.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/27/20.
//

import Foundation

enum APIError: Error {
    case invalidRequest
    case invalidResponse
    case jsonParsingError(error: Error)
    case dataLoadingError(statusCode: Int, data: Data)
}

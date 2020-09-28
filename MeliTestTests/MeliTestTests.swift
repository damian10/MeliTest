//
//  MeliTestTests.swift
//  MeliTestTests
//
//  Created by Damian Pintos on 9/24/20.
//

import XCTest
@testable import MeliTest

class MeliTestTests: XCTestCase {

    var data: String!

    override func setUp() {
        data = loadJSON()
    }

    func testProductJson() {
        guard let products = Products(jsonString: data) else {
            XCTFail("Products error")
            return
        }
        XCTAssertNotNil(products, "Products validation")
    }

    func testShipping() {
        guard let products = Products(jsonString: data) else {
            XCTFail("Products error")
            return
        }
        XCTAssertNotNil(products, "Products validation")
    }

    func testProductInfo() {
        guard let products = Products(jsonString: data) else {
            XCTFail("Product info has not been loaded")
            return
        }
       
        XCTAssertEqual(products.items?[0].id ?? "", "MLU473420452")
        XCTAssertEqual(products.items?[0].title ?? "", "Apple Macbook Pro 13.3' Core I5 128ssd 8gb Touch Bar Loi")
        XCTAssertEqual(products.items?[0].price ?? 0, 1940)
        XCTAssertEqual(products.items?[0].thumbnail ?? "", "http://http2.mlstatic.com/D_645042-MLU42578083220_072020-I.jpg")
        XCTAssertEqual(products.items?[0].condition ?? "", "new")
        XCTAssertEqual(products.items?[0].shipping.freeShipping ?? false, false)
    }

}


extension MeliTestTests {
    func loadJSON() -> String {
        let nameFile = "MockedProducts"
        let bundle = Bundle(for: type(of: self))
        return String.json(fromFile: nameFile, bundle: bundle)
    }
}

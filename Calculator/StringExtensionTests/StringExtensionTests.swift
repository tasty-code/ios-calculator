//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_StringExtension의_split에_String이_String배열로_나오는지() {
        var input = "StringTest"
        let result = input.split(with: "s")
        let expectation = ["StringTest"]
        XCTAssertEqual(result, expectation)
    }
}

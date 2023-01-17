//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jason on 2023/01/16.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_원하는_데이터가_들어오는가() {
        // given
        let wishData = 0.0
        
        // when
        let result = sut.inqueue(data: wishData)
        
        // then
        XCTAssertEqual(wishData, false)
    }
}

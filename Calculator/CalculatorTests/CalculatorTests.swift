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
    
    func test_LinkedList의_Head가_없을때_isEmptyHead가_True를_반환하는지() {
        //given
        //when
        let result = sut.linkedList.isHeadEmpty()
        //than
        XCTAssertTrue(result)
    }
}

//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jason on 2023/01/16.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: LinkedList!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_LinkedList의_Head가_없을때_isEmptyHead가_True를_반환하는지() {
        //given
        //when
        let result = sut.isHeadEmpty()
        //than
        XCTAssertTrue(result)
    }
    
    func test_LinkedList의_Head가_첫번째_Node로_추가되는지확인() {
        // given
        let input = Node(next: nil, data: 0.0, operators: nil)
        
        // when
        let _ = sut.inqueue(data: input)
        let result = sut.isHeadEmpty()
        
        // then
        XCTAssertTrue(result)
    }
}

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
    
    func test_LinkedList의_inqueue가_Node의_Head로_추가되는지확인() {
        // given
        let input = Node(next: nil, data: 0.0, operators: nil)
        
        // when
        let _ = sut.append(data: input)
        let result = sut.isHeadEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_LinkedList의_inqueue가_Head의_다음Node를_연결하는지() {
        //given
        let input = Node(next: nil, data: 0.0, operators: nil)
        let newinput = Node(next: nil, data: 0.0, operators: nil)
        
        sut.append(data: input)
        //when
        sut.append(data: newinput)
        input.next = newinput
        
        //than
        XCTAssertNotNil(input.next)
    }
    
    func test_StringExtension의_split에_String이_String배열로_나오는지() {
        // given
        var input = "StringTest"
        
        // when
        let expectation = ["StringTest"]
        
        // then
        let result = input.split(with: "a")
        XCTAssertEqual(result, expectation)
    }
    
    func test_StringExtension의_split에_String이_with에_입력된_파라미터값_기준으로_나눠지는지() {
        // given
        var input = "String+Test"
        
        // when
        let expectation = ["String","Test"]
        
        // then
        let result = input.split(with: "+")
        XCTAssertEqual(result, expectation)
    }
}

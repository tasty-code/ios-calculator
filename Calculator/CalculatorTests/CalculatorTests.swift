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
    
    func test_LinkedList의_removeLast가_Node를_삭제하는지() {
        //given
        let node1 = Node(data: 1.0)
        let node2 = Node(data: 2.0)
        
        sut.append(data: node1)
        let head = sut.getHead()
        
        sut.append(data: node2)
        head?.next == node2
        
        //when
        sut.removeLast()
        
        //then
        let result = head?.next
        
        XCTAssertNil(result)
    }
}

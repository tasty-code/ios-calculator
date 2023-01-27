//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jason on 2023/01/16.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: LinkedList<Any>!
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
        let input = Node(next: nil, data: 0.0)
        
        // when
        let _ = sut.append(data: input)
        let result = sut.isHeadEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_LinkedList의_inqueue가_Head의_다음Node를_연결하는지() {
        //given
        let input = Node(next: nil, data: 0.0)
        let newinput = Node(next: nil, data: 0.0)
        
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
        
        //when
        sut.removeLast()
        
        //then
        let result = head?.next
        
        XCTAssertNil(result)
    }
    
    func test_LinkedList의_myLinkedListDataMap이_올바르게작동하는지() {
        let nodes = [
            Node(data: 1.0),
            Node(data: 2.0),
            Node(data: 3.0),
            Node(data: 4.0),
            Node(data: 5.0),
            Node(data: 6.0)
        ]
        
        nodes.forEach {
            sut.append(data: $0.data)
        }
        
        let expectation = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        
        guard let resultArray = sut.myLinkedListDataMap() else { return }
        let result = resultArray.map{$0 as! Double}
        XCTAssertEqual(result, expectation)
    }
    
    func test_LinkedList의_myLinkedListFilter가_올바르게작동하는지() {
        let nodes = [
            Node(data: 1.0),
            Node(data: 2.0),
            Node(data: 3.0),
            Node(data: 4.0),
            Node(data: 5.0),
            Node(data: 6.0)
        ]
        
        nodes.forEach {
            sut.append(data: $0.data)
        }
        
        let resultArray = sut.myLinkedListFilter { node in
            node.data as! Double >= 5.0
        }
        
        let expectation = [5.0, 6.0]
        
        guard let resultArray else { return }
        let result = resultArray.map{ $0 as! Double }
       
        XCTAssertEqual(result, expectation)
    }
}

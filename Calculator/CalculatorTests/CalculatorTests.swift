//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 정연호 on 2022/09/05.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var queue = CalculatorItemQueue<Int>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEnqueue() {
        queue.enqueue(1)
        
        XCTAssertEqual(queue.list, [1])
    }
    
    func testEnqueue후queue가isEmpty하지않는다() {
        queue.enqueue(1)
        
        XCTAssertFalse(queue.isEmpty)
    }
    
    func testQuque가isEmpty할때peak가nil이다() {
        XCTAssertNil(queue.peek())
    }
    
    func testQuque가isEmpty할때dequeue가nil이다() {
        XCTAssertNil(queue.dequeue())
    }
    
    func testQueue가enqueue되면count가늘어난다() {
        queue.enqueue(1)
        
        XCTAssertEqual(queue.count, 1)
    }
    
    func testQueue가비어있을때isEmpty한다() {
        XCTAssertTrue(queue.isEmpty)
    }
    
    func testQueue에많은원소가enqueue된다() {
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(queue.list, [1, 2])
    }
    
    func testQueue에많은원소가추가되어도peek가된다() {
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(queue.peek(), 1)
    }
    
    func testQueue에많은원소가추가되어도dequque가된다() {
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(queue.dequeue(), 1)
    }
    
    func testQueue가clear된다() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.clear()
        
        XCTAssertTrue(queue.isEmpty)
    }

}

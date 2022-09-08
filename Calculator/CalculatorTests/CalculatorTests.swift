//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 정연호 on 2022/09/05.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCalculatorItemQueue() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enqueue(1)
        
        XCTAssertFalse(queue.isEmpty)
        
        XCTAssertEqual(try? queue.peek(), 1)
        
        XCTAssertEqual(queue.count, 1)
        
        XCTAssertEqual(try? queue.dequeue(), 1)
        
        XCTAssertEqual(queue.count, 0)

        XCTAssertNil(try? queue.peek())

        XCTAssertNil(try? queue.dequeue())

        XCTAssertTrue(queue.isEmpty)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

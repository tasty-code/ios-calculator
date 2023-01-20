import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {

    var sut1: CalculatorItemQueue<Double>!
    var sut2: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()

        sut1 = CalculatorItemQueue()
        sut2 = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut1 = nil
        sut2 = nil
    }
    
    func test_enqueue가_Double을_받아서_LinkedList에_넣는지() {
        let inputDouble = 0.5
        
        sut1.enQueue(element: inputDouble)
        let result = sut1.isHeadEmpty()
        
        XCTAssertFalse(result)
    }
    
    func test_enqueue가_Operator를_받아서_LinkedList에_넣는지() {
        let inputOperator = Operator.add
        
        sut2.enQueue(element: inputOperator)
        let result = sut2.isHeadEmpty()
        
        XCTAssertFalse(result)
    }
}

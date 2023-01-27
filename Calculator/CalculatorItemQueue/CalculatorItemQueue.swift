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
        // given
        let inputDouble = 0.5
        
        // when
        sut1.enqueue(element: inputDouble)
        
        // then
        let result = sut1.isHeadEmpty()
        XCTAssertFalse(result)
    }
    
    func test_enqueue가_Operator를_받아서_LinkedList에_넣는지() {
        // given
        let inputOperator = Operator.add
        
        // when
        sut2.enqueue(element: inputOperator)
        
        // then
        let result = sut2.isHeadEmpty()
        XCTAssertFalse(result)
    }
    
    func test_dequeue가_Double을_받아서_LinkedList에서_삭제하는지(){
        // given
        let inputDouble = 0.5
        
        // when
        sut1.enqueue(element: inputDouble)
        sut1.dequeue()
        
        //then
        let result = sut1.isHeadEmpty()
        XCTAssertTrue(result)
    }
    
    func test_dequeue가_Operator의_Case을_받아서_LinkedList에서_삭제하는지() {
        // given
        let inputOperator = Operator.multiply
        
        // when
        sut2.enqueue(element: inputOperator)
        sut2.dequeue()
        
        //then
        let result = sut2.isHeadEmpty()
        XCTAssertTrue(result)
    }
}

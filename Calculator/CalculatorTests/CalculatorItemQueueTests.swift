import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: Queue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Double>()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈큐에_3을_인큐하고_디큐했을_때_큐는_비어있다() {
        sut.enqueue(3)
        
        sut.dequeue()
        
        let result = sut.getListItem
        
        let emptyList: [Double] = []
        
        XCTAssertEqual(result, emptyList)
    }
    
    func test_빈큐에_디큐했을_때_오류가_발생하지_않는다() {
        sut.dequeue()
        
        let result = sut.getListItem
        
        let emptyList: [Double] = []
        
        XCTAssertEqual(result, emptyList)
    }
    
    func test_빈큐에_3을_인큐하고_큐리스트의_아이템을_가져온다() {
        sut.enqueue(3)
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [3])
    }
    
    func test_빈큐에_3을_인큐하고_큐가_비어있는지_확인했을_때_false를_반환한다() {
        sut.enqueue(3)
        
        let result = sut.isEmpty
        
        XCTAssertEqual(result, false)
    }
    
    func test_빈큐에_3과5를_인큐하고_큐를_클리어했을_때_큐가_비어있다() {
        sut.enqueue(3)
        sut.enqueue(5)
        
        sut.clear()
        
        let result = sut.getListItem
        
        XCTAssertEqual(result, [])
    }
}

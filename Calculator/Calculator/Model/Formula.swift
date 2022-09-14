import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue(), let rhs = operands.dequeue(), let _operator = operators.dequeue(),
              let result = Operator(rawValue: _operator.rawValue)?.calculate(lhs: lhs, rhs: rhs) else {
            return 0
        }
        
        return result
    }
}

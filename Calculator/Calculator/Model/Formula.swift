import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculateError.emptyQueue
        }

        while operands.isEmpty == false || operators.isEmpty == false {
            if let rhs = operands.dequeue(), let `operator` = operators.dequeue()?.rawValue,
               let calculatedValue = try Operator(rawValue: `operator`)?.calculate(lhs: result, rhs: rhs)  {
                result = calculatedValue
            } else {
                throw CalculateError.impossibleCalculate
            }
        }
        
        return result
    }
}

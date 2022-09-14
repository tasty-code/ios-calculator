import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else {
            return 0
        }

        while operands.isEmpty == false {
            if let rhs = operands.dequeue(), let `operator` = operators.dequeue()?.rawValue,
               let calculatedValue = Operator(rawValue: `operator`)?.calculate(lhs: result, rhs: rhs)  {
                result = calculatedValue
            }
        }
        
        return result
    }
}

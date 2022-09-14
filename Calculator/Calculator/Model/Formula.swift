import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw FormulaError.emptyQueue
        }

        while operands.isEmpty == false || operators.isEmpty == false {
            if let rhs = operands.dequeue(), let `operator` = operators.dequeue()?.rawValue,
               let calculatedValue = Operator(rawValue: `operator`)?.calculate(lhs: result, rhs: rhs)  {
                print(rhs, `operator`)
                result = calculatedValue
            } else {
                throw FormulaError.impossibleCalculate
            }
        }
        return result
    }
}

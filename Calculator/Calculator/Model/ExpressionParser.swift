import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operators = componentsByOperators(from: input).compactMap { Double($0) == nil ? $0 : nil }
        
        operands.forEach {
            operandsQueue.enqueue(Double($0))
        }
        
        operators.forEach {
            if let `operator` = Operator(rawValue: Character($0)) {
                operatorsQueue.enqueue(`operator`)
            }
        }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        
        return splitedInput
    }
}

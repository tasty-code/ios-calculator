import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let splitedInput = input.split(with: " ")
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        if let lhs = Double(splitedInput[0]), let rhs = Double(splitedInput[2]),
              let `operator` = Operator(rawValue: Character(splitedInput[1])) {
            operands.enqueue([lhs, rhs])
            operators.enqueue([`operator`])
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    // 어디에서 쓰이는 함수인지 잘 모르겠음
    static private func componentsByOperators(from input: String) -> [String] {
        return [String]()
    }
}

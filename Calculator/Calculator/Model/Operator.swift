import Foundation

enum Operator: Character, CalculatorItem, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double, oper: Operator) -> Double {
        switch oper {
        case .add:
            return add(lhs, rhs)
        case .substract:
            return substract(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        }
    }
    
    private func add(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func substract(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func divide(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private func multiply(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs * rhs
    }
}

import Foundation

enum Operator: Character, CalculatorItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        
    }
}

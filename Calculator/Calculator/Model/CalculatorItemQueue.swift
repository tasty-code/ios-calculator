import Foundation

class CalculatorItemQueue: CalculatorItem {
    public var numbers: Queue<Double> = Queue<Double>()
    public var operators: Queue<Character> = Queue<Character>()
    
    public func getCalculatorItems() -> (Queue<Double>, Queue<Character>) {
        return (numbers, operators)
    }
}

protocol CalculatorItem {
    
}


extension Double: CalculatorItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}

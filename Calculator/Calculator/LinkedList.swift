//
//  LinkedList.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/17.
//

import Foundation

final class LinkedList {
    static var shared = LinkedList()
    private init() {}
    
    private var head: ItemNode?
    
    func append(data: Value) {
        if head == nil {
            head = ItemNode(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = ItemNode(data: data)
    }
    
    @discardableResult
    func remove() -> Value? {
        let result: Value?
        
        guard head != nil else {
            return nil
        }
        
        result = head?.data
        head = head?.next
        
        return result
    }
}

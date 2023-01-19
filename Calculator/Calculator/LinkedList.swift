//
//  LinkedList.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/17.
//

import Foundation

final class LinkedList {
    private var head: ItemNode?
    private var tail: ItemNode?
    
    func append(data: Value) {
        if head == nil {
            head = ItemNode(data: data)
            tail = head
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = ItemNode(data: data)
        tail = node?.next
    }
    
    @discardableResult
    func remove() -> Value? {
        guard head != nil else {
            return nil
        }
        
        let result: Value?
        
        result = head?.data
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return result
    }
}

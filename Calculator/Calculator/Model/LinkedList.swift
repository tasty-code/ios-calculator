//
//  LinkedList.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct LinkedList {
    private var head: Node?
    
    func isHeadEmpty() -> Bool {
        return head == nil
    }
    
    mutating func inqueue(data: Node) {
        if head == nil {
            head = data
            return
        }
    }
    
    func dequeue() {
        
    }
    
}

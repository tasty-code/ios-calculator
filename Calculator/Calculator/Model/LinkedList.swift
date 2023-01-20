//
//  LinkedList.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct LinkedList<Element> {
    private var head: Node<Element>?
    
    func isHeadEmpty() -> Bool {
        return head == nil
    }
    
    func getHead() -> Node<Element>? {
        return head
    }
    
    mutating func append(data: Element) {
        if head == nil {
            head = Node(data: data)
            return
        } else {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(data: data)
        }
    }
    
    mutating func removeLast() {
        // 기존 코드
        let head = getHead()
        var node = head
        var preNode: Node<Element>?

        while node?.next != nil {
            preNode = node
            node = node?.next
        }
        preNode?.next = nil
        self.head = nil
    }
}

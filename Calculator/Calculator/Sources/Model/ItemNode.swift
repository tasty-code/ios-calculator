//
//  ItemNode.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

protocol CalculateItem {
}

final class ItemNode: CalculateItem {
    let data: String
    var next: ItemNode?
    
    init(data: String, next: ItemNode? = nil) {
        self.data = data
        self.next = next
    }
}


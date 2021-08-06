//
//  Stack.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-08-04.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> {
    /// number of elements in bag
    private(set) var index: Int = 0
    /// beginning of bag
    private var first: Node<E>? = nil
    
    public init() { }

    class Node<E> {
        fileprivate var value: E
        fileprivate var next: Node<E>?
        
        fileprivate init(value: E, next node: Node<E>? = nil) {
            self.value = value
            self.next = node
        }
    }
    
    func push(value: E) {
        let node = Node<E>(value: value)
        if let first = self.first {
            node.next = first
            self.first = node
        } else {
            self.first = node
        }
        self.index += 1
    }
    
    func pop() -> E? {
        guard let first = self.first else { return nil }
        let node = first
        self.first = first.next
        node.next = nil
        self.index -= 1
        return node.value
    }
    
    func peek() -> E? {
        return self.first?.value
    }
    
    /// Returns true if this bag is empty.
    /// - Returns: true if this bag is empty, otherwise false.
    public func isEmpty() -> Bool {
      return first == nil
    }
}

extension Stack: Sequence {
    public struct StackIterator<E>: IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.value {
                self.current = current?.next
                return item
            }
            return nil
        }
    }
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

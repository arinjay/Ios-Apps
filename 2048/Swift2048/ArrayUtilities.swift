//
//  ArrayUtilities.swift
//  Swift2048
//
//  Created by Arinjay Sharma on 17/7/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//
import Foundation

extension Array {
    var size: Int { return Int(sqrt(Double(count))) }
    
    subscript(x: Int, y: Int) -> Element {
        get { return self[(y * size) + x] }
        set { self[(y * size) + x] = newValue }
    }
    
    func coord(at index: Int) -> (x: Int, y: Int) {
        return (x: index % size, y: Int(index / size))
    }
    
    func randomElement() -> Element? {
        return self.count > 0 ? self[Int(arc4random_uniform(UInt32(self.count)))] : nil
    }
}

extension Array where Element : Equatable {
    func indecies(of value: Element) -> [(x: Int, y: Int)] {
        return self.enumerated().flatMap { $0.element == value ? coord(at: $0.offset) : nil }
    }
}

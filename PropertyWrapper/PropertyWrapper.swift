//
//  PropertyWrapper.swift
//  VKClientSwiftUI
//
//  Created by Alex on 12.12.2021.
//

import Foundation

@propertyWrapper
struct Trimmed {
    private(set) var space: String = ""
    
    var wrappedValue: String {
        get { return space }
        set { space = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    init(initialWrapper: String) {
        self.wrappedValue = initialWrapper
    }
    
}

@propertyWrapper

struct CamelCase {
    
    private var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            let result = value.split(separator: "_")
                .map { String($0)}
                .enumerated()
                .map{ $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
                .joined()
            print(result)
        }
    }
}

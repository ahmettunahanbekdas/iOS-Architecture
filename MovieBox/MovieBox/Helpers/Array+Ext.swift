//
//  Array+Ext.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 4.09.2024.
//

import Foundation

public extension Array {
    
    struct IndexOutOfBoundsError: Error { }
    
    func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}

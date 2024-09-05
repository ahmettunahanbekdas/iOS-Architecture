//
//  Optional+Ext.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 4.09.2024.
//

import Foundation

public extension Optional {
    struct FoundNilWhileUnwrappingError: Error { }
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}


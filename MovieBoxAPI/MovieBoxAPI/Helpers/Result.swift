//
//  Result.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 31.08.2024.
//

import Foundation


public enum Result<Value> {
    case succes(Value)
    case failure(Error)
}

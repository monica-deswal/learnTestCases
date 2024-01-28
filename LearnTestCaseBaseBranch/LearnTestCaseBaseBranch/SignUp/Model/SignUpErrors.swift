//
//  SignUpErrors.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 27/01/24.
//

import Foundation

enum SignUpErrors: LocalizedError, Equatable {
    
    case responseModelParsingError
    case invalidRequuestURLStringError
    case failedRequest(description: String)
    
    public var errorDescription: String? {
        switch self {
            
        case .failedRequest(let description):
            return description
        case .invalidRequuestURLStringError, .responseModelParsingError:
            return ""
        }
    }
}

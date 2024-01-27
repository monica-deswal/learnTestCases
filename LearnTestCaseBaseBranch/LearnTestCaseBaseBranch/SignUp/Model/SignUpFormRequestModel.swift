//
//  SignUpFormRequestModel.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 27/01/24.
//

import Foundation

struct SignUpFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

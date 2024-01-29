//
//  SignupWebServiceProtocol.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignUpFormRequestModel, completioHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void)
}

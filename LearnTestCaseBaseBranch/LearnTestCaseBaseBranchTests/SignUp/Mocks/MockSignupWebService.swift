//
//  MockSignupWebService.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation
@testable import LearnTestCaseBaseBranch


class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: LearnTestCaseBaseBranch.SignUpFormRequestModel, completioHandler: @escaping (LearnTestCaseBaseBranch.SignUpFormResponseModel?, LearnTestCaseBaseBranch.SignUpErrors?) -> Void) {
        
        isSignupMethodCalled = true
    }
    
    
    
}

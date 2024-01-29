//
//  MockSignupModelValidator.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation
@testable import LearnTestCaseBaseBranch

class MockSignupModelValidator: SignupModelValidatorProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailAddressValidated: Bool = false
    var isPasswordValidated: Bool = false
    var doPasswordMatch: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailAddressValidated = true
        return isEmailAddressValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        doPasswordMatch = password == repeatPassword ? true : false
        return doPasswordMatch
    }
    
    
    
}

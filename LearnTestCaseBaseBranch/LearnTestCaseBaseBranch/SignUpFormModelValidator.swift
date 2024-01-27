//
//  SignUpFormModelValidator.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 26/01/24.
//

import Foundation

struct SignUpFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if (firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength) {
            returnValue = false
        }
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        
        return password == repeatPassword ? true : false
    }
    
}

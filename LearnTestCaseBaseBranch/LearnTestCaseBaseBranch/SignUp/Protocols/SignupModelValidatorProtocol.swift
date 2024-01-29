//
//  SignupModelValidatorProtocol.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isValidEmailFormat(email: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
    
}

//
//  SignupViewDelegateProtocol.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    
    func successfulSignup()
    func errorHandler(error: SignUpErrors)
}

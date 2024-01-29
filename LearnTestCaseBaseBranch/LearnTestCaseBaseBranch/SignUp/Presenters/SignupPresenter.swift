//
//  SignupPresenter.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 28/01/24.
//

import Foundation

struct SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private var delegate: SignupViewDelegateProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol, webService:SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
            
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: formModel.password
                                               , repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignUpFormRequestModel(firstName: formModel.firstName
                                                  , lastName: formModel.lastName
                                                  , email: formModel.email
                                                  , password: formModel.password)
        
        webService.signup(withForm: requestModel) { (responseModel, error) in
            
        }
    }
}

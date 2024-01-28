//
//  LearnTestCaseBaseBranchTests.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 25/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

final class LearnTestCaseBaseBranchTests: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpFormModel_WheCreated_EmailShouldHaveValidFormat() {
        let firstName = ""
        let lastName = ""
        let password = ""
        let repeatPassword = ""
        let email = "test@test.com"
        let sigUpFormModel = SignUpFormModel(firstName: firstName
                                             , lastName: lastName
                                             , email: email
                                             , password: password
                                             , repeatPassword: repeatPassword)
        
        //Act
        let isEmailValid = sigUpFormModel.isValidEmail()
        
        //Assert
        XCTAssertTrue(isEmailValid, "Provided valid email address does ot have a valid format")
    }
    
    func testSigUpFormModel_whencreated_EmailValidationShouldFail() {
        let firstName = ""
        let lastName = ""
        let password = ""
        let repeatPassword = ""
        let email = "testtest.com"
        
        let sigUpFormModel = SignUpFormModel(firstName: firstName
                                             , lastName: lastName
                                             , email: email
                                             , password: password
                                             , repeatPassword: repeatPassword)
        
        let isEmailFormatValid = sigUpFormModel.isValidEmail()
        
        XCTAssertFalse(isEmailFormatValid, "Email address format is not correct")
    }
}

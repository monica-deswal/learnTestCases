//
//  SignUpFormModelValidator.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 26/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

final class SignUpFormModelValidatorTests: XCTestCase {

    var sut: SignUpFormModelValidator!
    
    override func setUpWithError() throws {
        sut = SignUpFormModelValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        //Arrange
    //    let sut = SignUpFormModelValidator()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Somya")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhentooShortFirstNameProvided_ShouldReturnFalse() {
        
        //Arrange
     //   let sut = SignUpFormModelValidator()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "s")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters")
    }
    
    func testSignUpFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "gfdcgfdcgfdcgdcgdcgdcgd")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have retured FALSE for a first time that is that is longer than \(SignupConstants.firstNameMaxLength) chahracters but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenEqualPasswordsProvided_shouldReturnTrue() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for matchig passwords but it has returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenNoMatchingPasswordsProvided_shouldReturnFalse() {
        
        let doPasswordMatch = sut.doPasswordMatch(password: "1234567", repeatPassword: "12345678")
        
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned FALSE for not matchig passwords but it has returned TRUE")
    }
}

//
//  SignUpPresenterTests.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 28/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

final class SignUpPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate! = nil
    
    override func setUp()  {
        
        signupFormModel = SignupFormModel(firstName: "Manya"
                                               , lastName: "Sharma"
                                               , email: "mannu_darling@gmail.com"
                                               , password: "12345678"
                                               , repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator
                                  , webService: mockSignupWebService
                                  , delegate: mockSignupViewDelegate)
    }
    
    override func tearDown() {
        
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testSignUpPresenter_WhenInformatioProvided_WillValidateEachProperty() {
        
        sut.processUserSignup(formModel: signupFormModel)
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "first name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailAddressValidated, "email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.doPasswordMatch, "did not validated if password match")
        
    }
    
//    func testSignUpPresenter_WhenGivenVlidFormModel_ShouldCallSignupMethod() {
//        let signupFormModel = SignupFormModel(firstName: "Manya"
//                                               , lastName: "Sharma"
//                                               , email: "mannu_darling@gmail.com"
//                                               , password: "12345678"
//                                               , repeatPassword: "12345678")
//        let mockSignupModelValidator = MockSignupModelValidator()
//        
//        let mockSignupWebService = MockSignupWebService()
//        
//        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
//        sut.processUserSignup(formModel: signupFormModel)
//    }
        
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
//        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
        sut.processUserSignup(formModel: signupFormModel)
        
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The Signup() method was not called in the SignupWebservice class")
    }
    
    func testSignupPresenter_WhenSignupOPerationSuccessful_CallsSuccessOnViewDelegate() {
        
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        sut.processUserSignup(formModel: signupFormModel)
        
        self.wait(for: [myExpectation], timeout: 5)
    }
}

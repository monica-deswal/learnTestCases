//
//  SignupWebserviceTests.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 27/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

final class SignupWebserviceTests: XCTestCase {
    
    var sut: SignupWebservice!
    var signFormRequestModel: SignUpFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebservice(urlString: SignUpConstants.signupURLStrig, urlSession: urlSession)
        
        signFormRequestModel = SignUpFormRequestModel(firstName: "Sanya", lastName: "Roshan", email: "test123@gmail.com", password: "12345678")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignUpWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup web service response expectation")
        
        sut.signup(withForm: signFormRequestModel) { (sigupResponseModel, error) in
            
            XCTAssertEqual(sigupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testSignUpWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        let jsonString = "{\"path\":\"users\",\"error\": \"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
    
        let expectation = self.expectation(description: "Signup web service response expectation")
        
        sut.signup(withForm: signFormRequestModel) { (sigupResponseModel, error) in
            
            XCTAssertNil(sigupResponseModel)
            XCTAssertEqual(error, SignUpErrors.responseModelParsingError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnError() {
        
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = SignupWebservice(urlString: "")
        
        sut.signup(withForm: signFormRequestModel) { (signUpResponseModel, error) in
            XCTAssertEqual(error, SignUpErrors.invalidRequuestURLStringError)
            XCTAssertNil(signUpResponseModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebservice_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localised description of an error"
        MockURLProtocol.error = SignUpErrors.failedRequest(description: errorDescription)
        
        sut.signup(withForm: signFormRequestModel) { (signFormResponseModel, error)in
            
            XCTAssertEqual(error, SignUpErrors.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}

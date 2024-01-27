//
//  SignupWebserviceTests.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 27/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

final class SignupWebserviceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        let sut = SignupWebservice(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")
        
        let signFormRequestModel = SignUpFormRequestModel(firstName: "Sanya", lastName: "Roshan", email: "test123@gmail.com", password: "12345678")
        let expectation = self.expectation(description: "Signup web service response expectation")
        
        sut.signup(withForm: signFormRequestModel) { (sigupResponseModel, error) in
            
            XCTAssertEqual(sigupResponseModel?.status, "ok")
        }
        
        self.wait(for: [], timeout: 5)
        expectation.fulfill()
    }
    
    
    
}

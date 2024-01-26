//
//  LearnTestCaseBaseBranchTests.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 25/01/24.
//

import XCTest
@testable import LearnTestCaseBaseBranch

/*
 Click o the project on the ru butto, click on edit schema we can disable the test cases there
 */
/*
 Code coverage : Same in edit schema, we will get options and in that click on Options -> Code coverage
 */
/*
 Arrange
 Act
 Assert
 */
/*
 Parallel Distributed testing on Multiple Simulator Clones
 Go on xcode prefereces (General -> Simulator parallel)
 In project click on Edit schema -> Execute in parallel (If possible)
 */

final class LearnTestCaseBaseBranchTests: XCTestCase {

    override class func setUp() {
        print("**** Class setup() method is called")
    }
    
    override func setUpWithError() throws {
        print("**** Instance setupWithError() method is called")
    }
    
    override class func tearDown() {
        print("**** class tearDow() method is called")
    }
    
    //This method is called after the invocation of each test method in the class.
    override func tearDownWithError() throws {
        print("***** Instance tearDownWithError() method is called")
    }

    func testExample() throws {
        print("**** test method is called")
        addTeardownBlock {
            // called when testExample() ends
            print("***** TearDownBlock is called when test method ends")
        }
    }
}

/*
 **** Class setup() method is called
 Test Case '-[LearnTestCaseBaseBranchTests.LearnTestCaseBaseBranchTests testExample]' started.
 **** Instance setupWithError() method is called
 **** test method is called
 ***** TearDownBlock is called when test method ends
 ***** Instance tearDownWithError() method is called
 Test Case '-[LearnTestCaseBaseBranchTests.LearnTestCaseBaseBranchTests testExample]' passed (0.003 seconds).
 **** class tearDow() method is called
 Test Suite 'LearnTestCaseBaseBranchTests' passed at 2024-01-26 09:17:30.518.
      Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.004) seconds
 */

//
//  ViewController.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 25/01/24.
//

import UIKit
/*
 Unit tests: Testing isolated small pieces of code with fake or Mock dependencies
 Integration tests: App code is tested without faking databases or HTTP connections
 UITests :- Automated tests to test user interface iteraction and behaviour.
 */

/*
 override class func tearDow()
 This methos is called at last after all the test cases run
 */
/*
 override func teadDownWithError()
 This method is called after every test execution
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

struct SignUpFormModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let repeatPassword: String
}

extension SignUpFormModel {
    
    func isValidEmail() -> Bool {
        
        return email.contains("@") && email.contains(".")
    }
}

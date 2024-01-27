//
//  SignupWebservice.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 27/01/24.
//

import Foundation

class SignupWebservice {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignUpFormRequestModel, completioHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            //TODO: create a uit test
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            //TODO: unit test to hadle error
            
            if let data = data, let signUpResposeModel = try? JSONDecoder().decode(SignUpFormResponseModel.self, from: data) {
                
                completioHandler(signUpResposeModel, nil)
            } else {
                //TODO: Handle error
            }
            
        }
        dataTask.resume()
        
    }
}

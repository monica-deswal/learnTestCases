//
//  SignupWebservice.swift
//  LearnTestCaseBaseBranch
//
//  Created by Monica Deshwal on 27/01/24.
//

import Foundation

class SignupWebservice: SignupWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignUpFormRequestModel, completioHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completioHandler(nil, SignUpErrors.invalidRequuestURLStringError)
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            if let requestError = error {
                completioHandler(nil, SignUpErrors.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signUpResposeModel = try? JSONDecoder().decode(SignUpFormResponseModel.self, from: data) {
                
                completioHandler(signUpResposeModel, nil)
            } else {
                completioHandler(nil, SignUpErrors.responseModelParsingError)
            }
            
        }
        dataTask.resume()
        
    }
}

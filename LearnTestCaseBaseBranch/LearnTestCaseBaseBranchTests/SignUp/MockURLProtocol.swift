//
//  MockURLProtocol.swift
//  LearnTestCaseBaseBranchTests
//
//  Created by Monica Deshwal on 27/01/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let sigUpError = MockURLProtocol.error {
            
            self.client?.urlProtocol(self, didFailWithError: sigUpError)
        } else {
            
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}

//
//  URLProtocolMock.swift
//  DLG_TestTests
//
//  Created by Achintha kahawalage on 2023-01-17.
//

import XCTest

class URLProtocolMock: URLProtocol {
    // this dictionary maps URLs to test data
    static var testURL:Data?

    // say we want to handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        // if we have a valid URL…
        self.client?.urlProtocol(self, didLoad: URLProtocolMock.testURL ?? Data())

        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }

    // this method is required but doesn't need to do anything
    override func stopLoading() { }
}

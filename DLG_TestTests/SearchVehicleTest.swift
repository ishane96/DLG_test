//
//  SearchVehicleTest.swift
//  DLG_TestTests
//
//  Created by Achintha kahawalage on 2023-01-17.
//

import XCTest
@testable import DLG_Test

final class SearchVehicleTest: XCTestCase {

//    let sut = SearchVM()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchVehicle() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\n    \"make\": \"KIA\",\n    \"model\": \"Picanto\",\n    \"details\": \"1.25 GT-line 5dr\",\n    \"engine\": \"1.25L\",\n    \"gearbox\": \"Manual\",\n    \"bodyType\": \"Hatchback\",\n    \"year\": \"2017\",\n    \"motExpiry\": \"20230918\"\n}"
        URLProtocolMock.testURL = jsonString.data(using: .utf8)
        
        let sut = SearchVM(urlSession: urlSession)
    
        let expectation = self.expectation(description: "Get Vehicle Details")
        
        sut.getVehicleDetails(registration: "XXYYZZZ") { status, message in
            XCTAssertEqual(sut.vehicle?.make, "KIA")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 15)
    }


}

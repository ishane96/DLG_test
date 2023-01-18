//
//  DLG_TestUITests.swift
//  DLG_TestUITests
//
//  Created by Achintha kahawalage on 2023-01-11.
//

import XCTest

final class DLG_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testTryButtons() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCUIApplication()/*@START_MENU_TOKEN@*/.staticTexts["TRY IT OUT"]/*[[".buttons[\"TRY IT OUT\"].staticTexts[\"TRY IT OUT\"]",".staticTexts[\"TRY IT OUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testEnterRegistrationTextField() throws {
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["GO"]/*[[".buttons[\"GO\"].staticTexts[\"GO\"]",".staticTexts[\"GO\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)
        element.swipeUp()

    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

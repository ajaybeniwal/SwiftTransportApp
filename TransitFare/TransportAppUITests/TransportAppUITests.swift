//
//  TransportAppUITests.swift
//  TransportAppUITests
//
//  Created by Ajay Singh on 11/3/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import XCTest

class TransportAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    
    func testExample() {
        
        let app = XCUIApplication()
        let button = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(3)
        button.tap()
        button.tap()
        snapshot("0SignIn")
        
        let tabBarsQuery = app.tabBars
        let ticketsButton = tabBarsQuery.buttons["Tickets"]
        ticketsButton.tap()
        app.navigationBars["My Tickets"].buttons["Add"].tap()
        
        let addpassButton = tabBarsQuery.buttons["AddPass"]
        addpassButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(1).staticTexts["Discount Day Pass-125"].tap()
        app.navigationBars["AddNewPass"].buttons["Save"].tap()
        
        let bustimeButton = tabBarsQuery.buttons["BusTime"]
        bustimeButton.tap()
      
        tabBarsQuery.buttons["More"].tap()
       
        tabBarsQuery.buttons["MyPass"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

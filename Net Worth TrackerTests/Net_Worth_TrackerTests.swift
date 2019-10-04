//
//  Net_Worth_TrackerTests.swift
//  Net Worth TrackerTests
//
//  Created by Mykola Burynok on 2019-10-01.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import XCTest
@testable import Net_Worth_Tracker

class Net_Worth_TrackerTests: XCTestCase {

    var controllerWithMockData: UserAccountsController!
    var controller: UserAccountsController!
    var dataProvider: DataProvider!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controllerWithMockData = UserAccountsController(viewModel: UserAccountsViewModel(), apiService: MockDataProvider())
        controller = UserAccountsController(viewModel: UserAccountsViewModel(), apiService: DataProvider())
        dataProvider = DataProvider()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserContollerMockDataProvider() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        controllerWithMockData.start()
        XCTAssertGreaterThan(controllerWithMockData.viewModel.tableViewModels.value.count, 0)
    }
    
    func testUserContollerDataProvider() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expect = expectation(description: "Data provider calls 'APIService' to access server data and returns User's Accounts.")
        dataProvider.fetchUserAccounts { userAccounts in
            XCTAssert(userAccounts.assets.cashAndInvestments.count > 0)
            expect.fulfill()
        }
        waitForExpectations(timeout: 4) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error)")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

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

    var controller: UserAccountsController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller = UserAccountsController(viewModel: UserAccountsViewModel(), apiService: MockDataProvider())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserContollerMockDataGeneration() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        controller.start()
        
        XCTAssertEqual(controller.viewModel.tableViewModels.value.count, 2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

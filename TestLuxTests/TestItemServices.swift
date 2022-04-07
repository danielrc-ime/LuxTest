//
//  TestLuxTests.swift
//  TestLuxTests
//
//  Created by Yonusa iOS on 04/04/22.
//

import XCTest
@testable import TestLux

class TestItemServices: XCTestCase {

    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testItemServices() throws {
        let itemServices = ItemServices(fileName: "items")
        itemServices.getItems { itemsModel, error in
            XCTAssert(error == nil)
        }
    }

    func testItemServicesFail() throws {
        let itemServices = ItemServices(fileName: "itemsTests")
        itemServices.getItems { itemsModel, error in
            XCTAssert(error != nil)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

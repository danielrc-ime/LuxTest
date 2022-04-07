//
//  TestMainVM.swift
//  TestLuxTests
//
//  Created by Yonusa iOS on 07/04/22.
//

import XCTest
@testable import TestLux

class TestMainVM: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResponse() throws {
        let mainVM = MainVM()
        mainVM.getData(fileName: "items")
        XCTAssert(!mainVM.itemsModel.isEmpty)
    }
    
    func testResponseFail() throws {
        let mainVM = MainVM()
        mainVM.getData(fileName: "itemsTests")
        XCTAssert(mainVM.itemsModel.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

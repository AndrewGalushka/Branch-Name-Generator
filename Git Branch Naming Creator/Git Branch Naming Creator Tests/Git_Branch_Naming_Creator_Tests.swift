//
//  Git_Branch_Naming_Creator_Tests.swift
//  Git Branch Naming Creator Tests
//
//  Created by Galushka on 3/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import XCTest
@testable import Git_Branch_Naming_Creator

class GitBranchNamingCreatorTests: XCTestCase {

    var nameConverotor: BranchNameConvertorType!
    
    override func setUp() {
        self.nameConverotor = BranchNameConvertor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsConversionCorrect1() {
        self.testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.testData1)
    }

    func testIsConversionCorrect2() {
        self.testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.testData2)
    }
    
    func testIsConversionCorrect3() {
        self.testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.testData3)
    }
    
    func testIsConversionCorrect4() {
        self.testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.testData4)
    }
    
    func testIsConversionCorrect5() {
        self.testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.testData5)
    }
    
    func testIsConversionCorrect(dataToTest: GitBranchConvertorTestsData.TestData) {
        do {
            let result = try self.nameConverotor.covert(text: dataToTest.input)
            
            XCTAssertEqual(result, dataToTest.correctResult)
        } catch (let error) {
            XCTAssertThrowsError(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = try? self.nameConverotor.covert(text: GitBranchConvertorTestsData.testData5.input)
            // Put the code you want to measure the time of here.
        }
    }

}

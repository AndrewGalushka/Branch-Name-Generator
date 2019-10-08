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
    
    func testConversionCorrect1() throws {
        let expected = "ga_2846_improve_matrix_presentation"
        
        let converted = try makeSUT().covert(text: "GA_2846 Improve Matrix presentation  ")
        
        XCTAssertEqual(converted, expected)
    }

    func testIsConversionCorrect2() throws {
        let expected = "ga_2846_improve_matrix_presentation"
        
        let converted = try makeSUT().covert(text:  "  GA 2846 impRove Matrix PResentation")
        
        XCTAssertEqual(converted, expected)
    }
    
    func testConversionCorrect3() throws {
        let expected = "gis_4359_do_not_show_error_alert_second_time_bug_fix"
        
        let converted = try makeSUT().covert(text: "GIS-4359 Do not show-Error Alert      second Time  Bug Fix")
        
        XCTAssertEqual(converted, expected)
    }
    
    func testConversionCorrect4() throws {
        let expected = "1_gis_4359_do_not_show_error_alert_2_times_in_a_row_3"
        
        let converted = try makeSUT().covert(text: "1GIS4359do----Not show error_ALERT 2times in a row3 ")
        
        XCTAssertEqual(converted, expected)
    }
    
    func testConversionCorrect5() throws {
        let expected = "gis_4359_do_not_show_error_alert_2_times_in_a_row"
        
        let converted = try makeSUT().covert(text: " #%^&&# GIS4359^##$*&^do----%!@#^Not show #!%______--@^ error!@%__%^#ALERT 2times in a row^^#$$^^&\n")
        
        XCTAssertEqual(converted, expected)
    }

    func testConversionCorrect6() throws {
        let expected = "13_gis_4359_do_not_show_error_alert_2_times_in_a_row"
        
        let converted = try makeSUT().covert(text: " #%^&&#13GIS4359^##$*&^do----%!@#^Not show #!%______--@^ error!@%__%^#ALERT 2times in a row^^#$$^^&\n")
        
        XCTAssertEqual(converted, expected)
    }
        
    func testPerformanceExample() throws {
        self.measure {
            _ = try? self.makeSUT().covert(text:  " #%^&&#13GIS4359^##$*&^do----%!@#^Not show #!%______--@^ error!@%__%^#ALERT 2times in a row^^#$$^^&\n")
        }
    }
    
    // MARK: - Helpers
    
    func makeSUT() -> BranchNameConvertorType {
        return BranchNameConvertor()
    }
}

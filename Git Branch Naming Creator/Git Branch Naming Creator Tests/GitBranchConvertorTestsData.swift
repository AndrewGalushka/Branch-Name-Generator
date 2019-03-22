//
//  GitBranchConvertorTestData.swift
//  Git Branch Naming Creator Tests
//
//  Created by Galushka on 3/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

struct GitBranchConvertorTestsData {
    
    static let testData1 = TestData(input: "VA_2846 Improve Matrix presentation  ",
                                correctResult: "va_2846_improve_matrix_presentation")
    
    static let testData2 = TestData(input: "  VA 2846 impRove Matrix PResentation",
                                    correctResult: "va_2846_improve_matrix_presentation")
    
    static let testData3 = TestData(input: "NIS-4359 Do not show-Error Alert      second Time  Bug Fix",
                                    correctResult: "nis_4359_do_not_show_error_alert_second_time_bug_fix")
    
    static let testData4 = TestData(input: "1NIS4359do----Not show error_ALERT 2times in a row3 ",
                                    correctResult: "1_nis_4359_do_not_show_error_alert_2_times_in_a_row_3")
    
    static let testData5 = TestData(input: " #%^&&# NIS4359^##$*&^do----%!@#^Not show #!%______--@^ error!@%__%^#ALERT 2times in a row^^#$$^^&\n",
                                    correctResult: "nis_4359_do_not_show_error_alert_2_times_in_a_row")
    
    static let testData6 = TestData(input: " #%^&&#13NIS4359^##$*&^do----%!@#^Not show #!%______--@^ error!@%__%^#ALERT 2times in a row^^#$$^^&\n",
                                    correctResult: "13_nis_4359_do_not_show_error_alert_2_times_in_a_row")
}

extension GitBranchConvertorTestsData {
    
    struct TestData {
        let input: String
        let correctResult: String
    }
}

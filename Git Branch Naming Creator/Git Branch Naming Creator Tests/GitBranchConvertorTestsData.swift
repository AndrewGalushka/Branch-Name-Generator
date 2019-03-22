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
    
    static let testData4 = TestData(input: "NIS4359do----Not show error_ALLERT 2times in a row",
                                    correctResult: "nis_4359_do_not_show_error_alert_2_times_in_a_row")
    
    static let testData5 = TestData(input: " #%^&&# NIS4359^##$*&^do----%!@#^N!@#%^ot sh!@#^!@#ow #!%______--@^ error!@%__%^#ALLERT 2times in a row^^#$$^^&/n",
                                    correctResult: "nis_4359_do_not_show_error_alert_2_times_in_a_row")
}

extension GitBranchConvertorTestsData {
    
    struct TestData {
        let input: String
        let correctResult: String
    }
}

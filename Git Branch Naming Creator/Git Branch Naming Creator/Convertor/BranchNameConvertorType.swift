//
//  BranchNameConvertorType.swift
//  Git Branch Naming Creator
//
//  Created by Galushka on 3/21/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

protocol BranchNameConvertorType: AnyObject {
    func covert(text: String) -> String
}

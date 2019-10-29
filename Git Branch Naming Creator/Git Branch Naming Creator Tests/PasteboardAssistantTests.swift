//
//  PasteboardAssistantTests.swift
//  Git Branch Naming Creator Tests
//
//  Created by Galushka on 10/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import XCTest
@testable import Git_Branch_Naming_Creator

class PasteboardAssistantTests: XCTestCase {

    let pasteboardAssistant = PasteboardAssistant.general
    
    func testExample() {
        pasteboardAssistant.writeText("PasteboardAssistantTests")
    }
}

//
//  Screen.swift
//  Git Branch Naming Creator
//
//  Created by Galushka on 3/22/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Cocoa

class Screen {
    static func currentScreenResolution() -> NSRect? {
        return NSScreen.main?.frame
    }
}

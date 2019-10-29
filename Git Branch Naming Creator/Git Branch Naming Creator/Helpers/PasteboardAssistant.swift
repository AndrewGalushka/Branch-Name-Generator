//
//  PasteboardAssistant.swift
//  Git Branch Naming Creator
//
//  Created by Galushka on 10/10/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import AppKit

class PasteboardAssistant {
    private let pasteboard: NSPasteboard
    
    init(_ pasteboard: NSPasteboard) {
        self.pasteboard = pasteboard
    }
    
    static var general: PasteboardAssistant {
        return PasteboardAssistant(NSPasteboard.general)
    }
    
    func writeText(_ string: String) -> Bool {
        self.pasteboard.clearContents()
        return self.pasteboard.writeObjects([string as NSString])
    }
}


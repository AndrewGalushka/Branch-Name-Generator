//
//  BranchNameConvertor.swift
//  Git Branch Naming Creator
//
//  Created by Galushka on 3/21/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Foundation

class BranchNameConvertor: BranchNameConvertorType {
    
    func covert(text: String) throws -> String {
        var result = ""
        
        // Trim whitespeses and new lines at beginning and end of the text
        result = text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)

        // Replace multy spaces and dash with "_"
        result = try self.replaceMultySpacesAndDashWithUnderline(in: result)
        
        // Insert underline between digit and letter
        result = try self.insertUnderlineBetweenDigitAndLetter(in: result)
        
        // Remove unallowed symbols
        result = try self.removeUnallowedSymbols(in: result)
        
        // Remove multy underline
        result = try self.removeMultyUnderline(in: result)
        
        return result.lowercased()
    }
    
    private func replaceMultySpacesAndDashWithUnderline(in text: String) throws -> String {
        let regex = try NSRegularExpression(pattern: "\\s+|-")
        let stringWithUnderline = NSMutableString(string: text)
        
        regex.replaceMatches(in: stringWithUnderline, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithUnderline.length), withTemplate: "_")
        
        return String(stringWithUnderline)
    }
    
    private func removeMultyUnderline(in text: String) throws -> String {
        let regex = try NSRegularExpression(pattern: "_{2,}")
        let result = regex.stringByReplacingMatches(in: text,
                                                    options: [],
                                                    range: NSRange.init(location: 0, length: text.count) ,
                                                    withTemplate: "_")
        
        return result
    }
    
    private func insertUnderlineBetweenDigitAndLetter(in text: String) throws -> String {
        var text = text
        let regex = try NSRegularExpression(pattern: "\\d+")
        let matches = regex.matches(in: text, options: [], range: NSRange.init(location: 0, length: text.count))
        
        var offset = 0
        
        for match in matches {
            
            var startIndex = text.index(text.startIndex, offsetBy: match.range.location + offset)
            
            if text.startIndex != startIndex {
                text.insert("_", at: startIndex)
                startIndex = text.index(startIndex, offsetBy: 1)
                offset += 1
            }
            
            let endIndex = text.index(startIndex, offsetBy: match.range.length)
            
            if text.endIndex != endIndex {
                text.insert("_", at: endIndex)
                offset += 1
            }
        }
        
        return text
    }
    
    private func removeUnallowedSymbols(in text: String) throws -> String {
        let regex = try NSRegularExpression(pattern: "[^a-zA-Z_\\d]+")
        let result = regex.stringByReplacingMatches(in: text,
                                                    options: [],
                                                    range: NSRange.init(location: 0, length: text.count),
                                                    withTemplate: "")
        
        return result
    }
}

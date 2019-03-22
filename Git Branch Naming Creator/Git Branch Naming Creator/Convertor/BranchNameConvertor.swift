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
        var resultString = ""
        
        // Trim whitespeses and new lines
        let trimmedString = text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        resultString = trimmedString

        // Replace multy spaces and dash with "_"
        resultString = try self.replaceMultySpacesAndDashWithUnderline(in: resultString)
        
        // Insert underline between digit and letter
        resultString = try self.insertUnderlineBetweenDigitAndLetter(in: resultString)
        
        // Remove unallowed symbols
        resultString = try self.removeUnallowedSymbols(in: resultString)
        
        // Remove multy underline
        resultString = try self.removeMultyUnderline(in: resultString)
        
        return resultString.lowercased()
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
        let matches = regex.matches(in: text, options: .reportCompletion, range: NSRange.init(location: 0, length: text.count))
        
        for match in matches {
            
            let startIndex = text.index(text.startIndex, offsetBy: match.range.location)
            text.insert("_", at: startIndex)
            
            let endIndex = text.index(text.startIndex, offsetBy: match.range.location + match.range.length + 1)
            text.insert("_", at: endIndex)
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

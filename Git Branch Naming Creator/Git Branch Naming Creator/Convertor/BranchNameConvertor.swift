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
        
        let insertUnderlineBetweenNumbersRegex = try NSRegularExpression(pattern: "\\d+")
        
        let results = insertUnderlineBetweenNumbersRegex.matches(in: resultString, options: .reportCompletion, range: NSRange.init(location: 0, length: resultString.count))
        
        for result in results {
            
            let startIndex = resultString.index(resultString.startIndex, offsetBy: result.range.location)
            resultString.insert("_", at: startIndex)
            
            let endIndex = resultString.index(resultString.startIndex, offsetBy: result.range.location + result.range.length + 1)
            resultString.insert("_", at: endIndex)
        }
        
        let removeMultyUnderlineRegex = try NSRegularExpression(pattern: "_+")
        
        let stringWithoutMultyUnderline = NSMutableString(string: resultString)
        removeMultyUnderlineRegex.replaceMatches(in: stringWithoutMultyUnderline, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: resultString.count), withTemplate: "_")
        resultString = String(stringWithoutMultyUnderline)
        
        let unallowedSymobolsRegex = try NSRegularExpression(pattern: "[^a-zA-Z_\\d]")
        
        let stringWithoutUnallowdSumbols = NSMutableString(string: resultString)
        unallowedSymobolsRegex.replaceMatches(in: stringWithoutUnallowdSumbols, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithoutUnallowdSumbols.length), withTemplate: "")
        resultString = String(stringWithoutUnallowdSumbols)
        
        return resultString.lowercased()
    }
    
    private func replaceMultySpacesAndDashWithUnderline(in text: String) throws -> String {
        let regex = try NSRegularExpression(pattern: "\\s+|-")
        let stringWithUnderline = NSMutableString(string: text)
        
        regex.replaceMatches(in: stringWithUnderline, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithUnderline.length), withTemplate: "_")
        
        return String(stringWithUnderline)
    }
}

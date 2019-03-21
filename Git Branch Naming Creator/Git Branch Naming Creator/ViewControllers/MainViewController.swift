//
//  ViewController.swift
//  Git Branch Naming Creator
//
//  Created by Galushka on 3/21/19.
//  Copyright © 2019 Galushka. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    @IBOutlet weak var entringTextField: NSTextField!
    @IBOutlet weak var copiedTextField: NSTextField!
    @IBOutlet weak var resultTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copiedTextField.alphaValue = 0.0
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func entringTextFieldEnterActionHandler(_ sender: Any) {
        
        if !entringTextField.stringValue.isEmpty {
            resultTextField.stringValue = validetedText(entringTextField.stringValue)
            textCopied()
        }
    }
    
    func textCopied() {
        
        NSPasteboard.general.clearContents()
        let success = NSPasteboard.general.writeObjects([resultTextField.stringValue as NSString])
        
        if success {
            NSAnimationContext.runAnimationGroup({ (animationContext) in
                animationContext.duration = 1.25
                copiedTextField.animator().alphaValue = 1.0
            }, completionHandler: {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75, execute: {
                    NSAnimationContext.runAnimationGroup({ (animationContext) in
                        animationContext.duration = 0.25
                        self.copiedTextField.animator().alphaValue = 0.0
                    },  completionHandler: nil)
                })
            })
        }
        
        
    }
    
    func validetedText(_ text: String) -> String {
        var resultString = ""
        
        let trimmedString = text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        resultString = trimmedString
        
        
        guard let regex = try? NSRegularExpression(pattern: "\\s+|-") else {
            return resultString.lowercased()
        }
        
        let stringWithUnderline = NSMutableString(string: resultString)
        
        regex.replaceMatches(in: stringWithUnderline, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithUnderline.length), withTemplate: "_")
        resultString = String(stringWithUnderline)
        
        guard let insertUnderlineBetweenNumbersRegex = try? NSRegularExpression(pattern: "\\d+") else {
            return resultString.lowercased()
        }
        
        let results = insertUnderlineBetweenNumbersRegex.matches(in: resultString, options: .reportCompletion, range: NSRange.init(location: 0, length: stringWithUnderline.length))
        
        for result in results {
            
            let startIndex = resultString.index(resultString.startIndex, offsetBy: result.range.location)
            resultString.insert("_", at: startIndex)
            
            let endIndex = resultString.index(resultString.startIndex, offsetBy: result.range.location + result.range.length + 1)
            resultString.insert("_", at: endIndex)
        }
        
        guard let removeMultyUnderlineRegex = try? NSRegularExpression(pattern: "_+") else {
            return resultString.lowercased()
        }
        
        let stringWithoutMultyUnderline = NSMutableString(string: resultString)
        removeMultyUnderlineRegex.replaceMatches(in: stringWithoutMultyUnderline, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithUnderline.length), withTemplate: "_")
        resultString = String(stringWithoutMultyUnderline)
        
        guard let unallowedSymobolsRegex =  try? NSRegularExpression(pattern: "[^a-zA-Z_\\d]") else {
            return resultString.lowercased()
        }
        
        let stringWithoutUnallowdSumbols = NSMutableString(string: resultString)
        unallowedSymobolsRegex.replaceMatches(in: stringWithoutUnallowdSumbols, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange.init(location: 0, length: stringWithoutUnallowdSumbols.length), withTemplate: "")
        resultString = String(stringWithoutUnallowdSumbols)
        
        return resultString.lowercased()
    }
}


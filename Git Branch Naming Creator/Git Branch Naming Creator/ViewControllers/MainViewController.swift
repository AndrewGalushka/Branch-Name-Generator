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
    
    private var branchNameConvertor: BranchNameConvertorType = BranchNameConvertor()
    
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
            resultTextField.stringValue = self.branchNameConvertor.covert(text: entringTextField.stringValue)
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
}


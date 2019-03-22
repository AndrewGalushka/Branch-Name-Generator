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
    
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    private var branchNameConvertor: BranchNameConvertorType = BranchNameConvertor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    private func setupUI() {
        copiedTextField.alphaValue = 0.0
        
        if let currentScreenSize = Screen.currentScreenResolution() {
            viewWidthConstraint.constant = round(currentScreenSize.width * 0.4)
            viewHeightConstraint.constant = round(currentScreenSize.height * 0.4)
        }
    }
    
    @IBAction func entringTextFieldEnterActionHandler(_ sender: Any) {
        
        if !entringTextField.stringValue.isEmpty {
            
            do {
                resultTextField.stringValue = try self.branchNameConvertor.covert(text: entringTextField.stringValue)
            } catch (let error) {
                resultTextField.stringValue = error.localizedDescription
            }
            
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


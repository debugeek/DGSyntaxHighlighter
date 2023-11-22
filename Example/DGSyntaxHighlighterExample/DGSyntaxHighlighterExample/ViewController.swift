//
//  ViewController.swift
//  DGSyntaxHighlighterExample
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Cocoa
import DGSyntaxHighlighter

class ViewController: NSViewController, NSTextViewDelegate {

    @IBOutlet var textView: NSTextView!
    
    lazy var highlighter = {
        var styleSheet = StyleSheet()
        styleSheet.addStyle(Style(kind: .text, foregroundColor: NSColor(named: "text")))
        styleSheet.addStyle(Style(kind: .emphasis, foregroundColor: NSColor(named: "emphasis")))
        styleSheet.addStyle(Style(kind: .heading, foregroundColor: NSColor(named: "heading")))
        styleSheet.addStyle(Style(kind: .link, foregroundColor: NSColor(named: "link")))
        styleSheet.addStyle(Style(kind: .string, foregroundColor: NSColor(named: "string")))

        let highlighter = DGSyntaxHighlighter(identifier: .markdown, styleSheet: styleSheet)
        return highlighter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    func textDidChange(_ noti: Notification) {
        let text = textView.string
        let attributedString = highlighter.attributedString(for: text, options: .all)
        textView.textStorage?.setAttributedString(attributedString)
    }

}


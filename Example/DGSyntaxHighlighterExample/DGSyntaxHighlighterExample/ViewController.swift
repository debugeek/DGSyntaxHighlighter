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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.layoutManager?.allowsNonContiguousLayout = true
    }
    
    func textDidChange(_ noti: Notification) {
        let text = textView.string
        let highlighter = DGSyntaxHighlighter(identifier: .markdown)
        let attributedString = highlighter.attributedString(for: text, options: .all)
        textView.textStorage?.setAttributedString(attributedString)
    }

}


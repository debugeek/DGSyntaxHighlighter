//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Language {

    public var inlineRules: [SyntaxRule] {
        return [
            SyntaxRule(name: "heading",
                       kind: .emphasis,
                       patterns: ["^\\#{1,6}[^\\S\\n].*"]),
        
            SyntaxRule(name: "emphasis",
                       kind: .emphasis,
                       patterns: ["(\\*{1,2}|\\~{1,2}).+?\\1",
                                  "\\b(\\_{1,2}).+?\\1\\b"]),

            SyntaxRule(name: "listItem",
                       kind: .keyword,
                       patterns: ["^[^\\S\\n]*(\\d\\.|\\*|\\-|\\+)[^\\S\\n]"]),

            SyntaxRule(name: "link",
                       kind: .link,
                       patterns: ["\\!?\\[.*\\]\\(.*\\)"]),
            
            SyntaxRule(name: "inlineCode",
                       kind: .string,
                       patterns: ["\\`.+?\\`"])
        ]
    }
    
    public var multilineRules: [SyntaxRule] {
        return [
            SyntaxRule(name: "codeBlock",
                       kind: .string,
                       patterns: ["^(\\`{3,})([\\s\\S]*?^[^\\S\\n]*\\1\\`*\\s*?$|[\\s\\S]*)"])
        ]
    }
    
}

//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Language {

    public var inlinePatterns: [Pattern] {
        return [
            Pattern(name: "heading",
                    kind: .emphasis,
                    regex: "^\\#{1,6}(?!\\#).*"),
        
            Pattern(name: "emphasis",
                    kind: .emphasis,
                    regex: "\\b(\\*{1,2}|\\_{1,2}|\\~{1,2})(?!\\1).+?\\1\\b"),

            Pattern(name: "list",
                    kind: .keyword,
                    regex: "^\\s*(\\d\\.|\\*|\\-|\\+)\\s+?"),

            Pattern(name: "link",
                    kind: .link,
                    regex: "\\!?\\[.*\\]\\(.+\\)"),
            
            Pattern(name: "inlineCode",
                    kind: .string,
                    regex: "\\`(?!\\`).+?\\`")
            ]
    }
    
    public var multilinePatterns: [Pattern] {
        return [
            Pattern(name: "codeBlock",
                    kind: .string,
                    regex: "^(\\`{3})(?!\\`)[\\s\\S]*?^\\1$")
        ]
    }
    
}

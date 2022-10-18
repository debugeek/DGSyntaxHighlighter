//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Language {
    
    public var defaultPatterns: [Pattern] {
        return [
            Pattern(name: "plain",
                    kind: .text,
                    regex: ".*"),
            
            Pattern(name: "heading",
                    kind: .emphasis,
                    regex: "(#{1,6}) (.+)"),
        
            Pattern(name: "boldItalic",
                    kind: .emphasis,
                    regex: "(\\*+(.+?)\\*+|~+(.+?)~+|_+(.+?)_+)"),
            
            Pattern(name: "image",
                    kind: .link,
                    regex: "!\\[(.*)\\]\\((.+)\\)"),
            
            Pattern(name: "link",
                    kind: .link,
                    regex: "\\[(.*)\\]\\((.+)\\)"),
            
            Pattern(name: "inlineCode",
                    kind: .string,
                    regex: "(?=`)`(?!`)[^`]*(?=`)`(?!`)")
            ]
    }
    
    public var exclusivePatterns: [Pattern] {
        return [
            Pattern(name: "codeBlock",
                    kind: .string,
                    regex: "```\\S*\\n[\\s\\S]*?\\n```")
        ]
    }
    
}

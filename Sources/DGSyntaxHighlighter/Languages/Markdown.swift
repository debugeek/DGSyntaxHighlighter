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
                    regex: "^#{1,6}[\\t ].+$"),
        
            Pattern(name: "bold",
                    kind: .emphasis,
                    regex: "(\\*{2})(?!\\*).+?\\1"),
            
            Pattern(name: "bold",
                    kind: .emphasis,
                    regex: "(_{2})(?!_).+?\\1"),
            
            Pattern(name: "italic",
                    kind: .emphasis,
                    regex: "(\\*{1})(?!\\*).+?\\1"),
            
            Pattern(name: "italic",
                    kind: .emphasis,
                    regex: "(_{1})(?!_).+?\\1"),
            
            Pattern(name: "strikethrough",
                    kind: .emphasis,
                    regex: "(~{2})(?!~).+?\\1"),
            
            Pattern(name: "image",
                    kind: .link,
                    regex: "!\\[(.*)\\]\\((.+)\\)"),
            
            Pattern(name: "link",
                    kind: .link,
                    regex: "\\[(.*)\\]\\((.+)\\)"),
            
            Pattern(name: "inlineCode",
                    kind: .string,
                    regex: "`(?!`)(.+?)`")
            ]
    }
    
    public var exclusivePatterns: [Pattern] {
        return [
            Pattern(name: "codeBlock",
                    kind: .string,
                    regex: "^```(?!`)\\S*\\n[\\s\\S]*?\\n```$")
        ]
    }
    
}

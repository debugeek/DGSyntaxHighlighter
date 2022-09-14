//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Language {
    
    public var patterns: [Pattern] {
        return [
            Pattern(name: "heading",
                    kind: .emphasis,
                    regex: "(#{1,6}\\s)(.*)"),
        
            Pattern(name: "boldItalic",
                    kind: .emphasis,
                    regex: "(\\*|\\_)+(\\S+)(\\*|\\_)+"),
            
            Pattern(name: "link",
                    kind: .link,
                    regex: "\\[([^\\]]+)\\]\\(([^\\)\"\\s]+)(?:\\s+\"(.*)\")?\\)"),
            
            Pattern(name: "image",
                    kind: .link,
                    regex: "\\!\\[([^\\]]+)\\]\\(([^\\)\"\\s]+)(?:\\s+\"(.*)\")?\\)"),
            
            Pattern(name: "code",
                    kind: .string,
                    regex: "(`[^`]{1,}`)")
            ]
    }
    
}

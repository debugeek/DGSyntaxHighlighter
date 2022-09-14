//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Style {
    
    public var patterns: [Pattern] {
        return [
            Pattern(name: "heading",
                    regex: "(#{1,6}\\s)(.*)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xAA0D91)),
        
            Pattern(name: "boldItalic",
                    regex: "(\\*|\\_)+(\\S+)(\\*|\\_)+",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFD8F3F)),
            
            Pattern(name: "link",
                    regex: "\\[([^\\]]+)\\]\\(([^\\)\"\\s]+)(?:\\s+\"(.*)\")?\\)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0x5482FF)),
            
            Pattern(name: "image",
                    regex: "\\!\\[([^\\]]+)\\]\\(([^\\)\"\\s]+)(?:\\s+\"(.*)\")?\\)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0x5482FF)),
            
            Pattern(name: "code",
                    regex: "(`[^`]{1,}`)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC6A5D))
            ]
    }
    
}

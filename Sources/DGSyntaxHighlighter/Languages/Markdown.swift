//
//  Markdown.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Markdown: Language {

    public var inlineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(kind: .heading,
                             rules: [
                                SyntaxRule(pattern: "^\\#{1,6}[^\\S\\n]",
                                           reservingHints: [0],
                                           anchorsMatchLines: true)
                             ]),

            SyntaxDescriptor(kind: .orderedList,
                             rules: [
                                SyntaxRule(pattern: "^[^\\S\\n]*(\\d+\\.)[^\\S\\n]",
                                           reservingHints: [0],
                                           anchorsMatchLines: true)
                             ]),
            
            SyntaxDescriptor(kind: .unorderedList,
                             rules: [
                                SyntaxRule(pattern: "^[^\\S\\n]*(\\*|\\-|\\+)[^\\S\\n]",
                                           reservingHints: [0],
                                           anchorsMatchLines: true)
                             ]),

            SyntaxDescriptor(kind: .inlineCode,
                             rules: [
                                SyntaxRule(pattern: "(?<!\\`)(\\`+)[^\\`\\n]+\\1(?!\\`)",
                                           reservingHints: [0]),
                             ]),

            SyntaxDescriptor(kind: .link,
                             rules: [
                                SyntaxRule(pattern: "\\!?\\[.*?\\]\\(.*?\\)")
                             ]),

            SyntaxDescriptor(kind: .emphasis,
                             rules: [
                                SyntaxRule(pattern: "(\\*{1,2}|\\~{1,2}).+?\\1",
                                           reservingHints: [1]),
                                SyntaxRule(pattern: "\\b(\\_{1,2}).+?\\1\\b",
                                           reservingHints: [1])
                             ])
        ]
    }
    
    public var multilineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(kind: .codeBlock,
                             rules: [
                                SyntaxRule(pattern: "^(\\`{3,})[^\\`]*$([\\s\\S]*?(^\\1\\`*\\h*$)|[\\s\\S]*)",
                                           reservingHints: [0],
                                           anchorsMatchLines: true),
                             ])
        ]
    }
    
}

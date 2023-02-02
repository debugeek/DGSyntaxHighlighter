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
            SyntaxDescriptor(name: "heading",
                             kind: .heading,
                             rules: [
                                SyntaxRule(pattern: "(^\\#{1,6}[^\\S\\n]).*",
                                           reservingHints: [1],
                                           anchorsMatchLines: true)
                             ]),

            SyntaxDescriptor(name: "listItem",
                             kind: .heading,
                             rules: [
                                SyntaxRule(pattern: "(^[^\\S\\n]*(\\d\\.|\\*|\\-|\\+)[^\\S\\n]).*",
                                           reservingHints: [1],
                                           anchorsMatchLines: true)
                             ]),

            SyntaxDescriptor(name: "link",
                        kind: .link,
                        rules: [
                           SyntaxRule(pattern: "\\!?\\[.*\\]\\(.*\\)"),
                        ]),

            SyntaxDescriptor(name: "emphasis",
                             kind: .emphasis,
                             rules: [
                                SyntaxRule(pattern: "(\\*{1,2}|\\~{1,2}).+?\\1",
                                           reservingHints: [1]),
                                SyntaxRule(pattern: "\\b(\\_{1,2}).+?\\1\\b",
                                           reservingHints: [1])
                             ]),
            
            SyntaxDescriptor(name: "inlineCode",
                             kind: .string,
                             rules: [
                                SyntaxRule(pattern: "\\`.+?\\`"),
                             ])
        ]
    }
    
    public var multilineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(name: "codeBlock",
                             kind: .string,
                             rules: [
                                SyntaxRule(pattern: "^(\\`{3,})([\\s\\S]*?^[^\\S\\n]*\\1\\`*\\s*?$|[\\s\\S]*)",
                                           reservingHints: [0],
                                           anchorsMatchLines: true),
                             ])
        ]
    }
    
}

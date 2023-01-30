//
//  Bash.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2023/1/15.
//  Copyright © 2023 debugeek. All rights reserved.
//

import Foundation

public struct Shell: Language {

    public var inlineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(name: "keywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(if|then|else|elif|fi|for|while|in|do|done|case|esac|function)\\b")
                             ]),

            SyntaxDescriptor(name: "literals",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(true|false)\\b")
                             ]),

            SyntaxDescriptor(name: "shellBuiltinKeywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(break|cd|continue|eval|exec|exit|export|getopts|hash|pwd|readonly|return|shift|test|times|trap|umask|unsed)\\b")
                             ]),
            
            SyntaxDescriptor(name: "bashBuiltinKeywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(alias|bind|builtin|caller|command|declare|echo|enable|help|let|local|logout|mapfile|printf|read|readarray|source|type|typeset|ulimit|unalias)\\b")
                             ]),
            
            SyntaxDescriptor(name: "variable",
                             kind: .emphasis,
                             rules: [
                                SyntaxRule(pattern: "\\$[\\w\\d]*")
                             ]),
            
            SyntaxDescriptor(name: "string",
                             kind: .string,
                             rules: [
                                SyntaxRule(pattern: "(\"|').*\\1")
                             ]),
            
            SyntaxDescriptor(name: "commentLine",
                             kind: .comment,
                             rules: [
                                SyntaxRule(pattern: "#.*")
                             ])
            ]
    }

    public var multilineDescriptors: [SyntaxDescriptor] {
        return []
    }

    
}


//
//  Bash.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2023/1/15.
//  Copyright © 2023 debugeek. All rights reserved.
//

import Foundation

public struct Shell: Language {

    public var inlineRules: [SyntaxRule] {
        return [
            SyntaxRule(name: "keywords",
                       kind: .keyword,
                       patterns: ["\\b(if|then|else|elif|fi|for|while|in|do|done|case|esac|function)\\b"]),

            SyntaxRule(name: "literals",
                       kind: .keyword,
                       patterns: ["\\b(true|false)\\b"]),

            SyntaxRule(name: "shellBuiltinKeywords",
                       kind: .keyword,
                       patterns: ["\\b(break|cd|continue|eval|exec|exit|export|getopts|hash|pwd|readonly|return|shift|test|times|trap|umask|unsed)\\b"]),
            
            SyntaxRule(name: "bashBuiltinKeywords",
                       kind: .keyword,
                       patterns: ["\\b(alias|bind|builtin|caller|command|declare|echo|enable|help|let|local|logout|mapfile|printf|read|readarray|source|type|typeset|ulimit|unalias)\\b"]),
            
            SyntaxRule(name: "variable",
                       kind: .emphasis,
                       patterns: ["\\$[\\w\\d]*"]),
            
            SyntaxRule(name: "string",
                       kind: .string,
                       patterns: ["(\"|').*\\1"]),
            
            SyntaxRule(name: "commentLine",
                       kind: .comment,
                       patterns: ["#.*"]),
            ]
    }

    public var multilineRules: [SyntaxRule] {
        return []
    }

    
}


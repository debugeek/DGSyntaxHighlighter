//
//  Bash.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2023/1/15.
//  Copyright © 2023 debugeek. All rights reserved.
//

import Foundation

public struct Shell: Language {

    public var inlinePatterns: [Pattern] {
        return [
            Pattern(name: "keywords",
                    kind: .keyword,
                    regex: "\\b(if|then|else|elif|fi|for|while|in|do|done|case|esac|function)\\b"),

            Pattern(name: "literals",
                    kind: .keyword,
                    regex: "\\b(true|false)\\b"),

            Pattern(name: "shellBuiltinKeywords",
                    kind: .keyword,
                    regex: "\\b(break|cd|continue|eval|exec|exit|export|getopts|hash|pwd|readonly|return|shift|test|times|trap|umask|unsed)\\b"),
            
            Pattern(name: "bashBuiltinKeywords",
                    kind: .keyword,
                    regex: "\\b(alias|bind|builtin|caller|command|declare|echo|enable|help|let|local|logout|mapfile|printf|read|readarray|source|type|typeset|ulimit|unalias)\\b"),

            Pattern(name: "string",
                    kind: .string,
                    regex: "\".*\""),

            Pattern(name: "commentLine",
                    kind: .comment,
                    regex: "#.*"),

            ]
    }

    public var multilinePatterns: [Pattern] {
        return []
    }

    
}


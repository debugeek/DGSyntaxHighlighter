//
//  Swift.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Swift: Language {

    public var inlineRules: [SyntaxRule] {
        return [
            SyntaxRule(name: "keywords",
                       kind: .keyword,
                       patterns: ["\\b(actor|any|associatedtype|async|await|as(\\?|!)?|break|case|catch|class|continue|convenience|default|defer|deinit|didSet|distributed|do|dynamic|else|enum|extension|fallthrough|fileprivate(\\(set\\))?|final|for|func|get|guard|if|import|indirect|infix|init(\\?|!)?|inout|internal(\\(set\\))?|in|is|isolated|nonisolated|lazy|let|mutating|nonmutating|open(\\(set\\))?|operator|optional|override|postfix|precedencegroup|prefix|private(\\(set\\))?|protocol|public(\\(set\\))?|repeat|required|rethrows|return|set|some|static|struct|subscript|super|switch|throws|throw|try(\\?|!)?|typealias|unowned(safe|unsafe)?|var|weak|where|while|willSet)\\b"]),

            SyntaxRule(name: "literals",
                       kind: .keyword,
                       patterns: ["\\b(true|false|nil)\\b"]),
            
            SyntaxRule(name: "precedencegroupKeywords",
                       kind: .keyword,
                       patterns: ["\\b(assignment|associativity|higherThan|left|lowerThan|none|right)\\b"]),
            
            SyntaxRule(name: "numberSignKeywords",
                       kind: .keyword,
                       patterns: ["#(colorLiteral|column|dsohandle|else|elseif|endif|error|file|fileID|fileLiteral|filePath|function|if|imageLiteral|keyPath|line|selector|sourceLocation|warn_unqualified_access|warning)\\b"]),
            
            SyntaxRule(name: "keywordAttributes",
                       kind: .keyword,
                       patterns: ["@(autoclosure|convention|discardableResult|dynamicCallable|dynamicMemberLookup|escaping|frozen|GKInspectable|IBAction|IBDesignable|IBInspectable|IBOutlet|IBSegueAction|inlinable|main|nonobjc|NSApplicationMain|NSCopying|NSManaged|objc|objc|objcMembers|propertyWrapper|requires_stored_property_inits|resultBuilder|testable|UIApplicationMain|unknown|usableFromInline)\\b"]),
            
            SyntaxRule(name: "string",
                       kind: .string,
                       patterns: ["\".*\""]),
            
            SyntaxRule(name: "commentLine",
                       kind: .comment,
                       patterns: ["//.*"])
            ]
    }
    
    public var multilineRules: [SyntaxRule] {
        return [
            SyntaxRule(name: "stringBlock",
                       kind: .string,
                       patterns: ["(\\\"{3})(?!\\\")[\\s\\S]*?\\1"]),
            
            SyntaxRule(name: "commentBlock",
                       kind: .comment,
                       patterns: ["/\\*[\\s\\S]*?\\*/"])
        ]
    }
    
}

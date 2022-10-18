//
//  Swift.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Swift: Language {

    public var defaultPatterns: [Pattern] {
        return [
            Pattern(name: "plain",
                    kind: .text,
                    regex: ".*"),
            
            Pattern(name: "keywords",
                    kind: .keyword,
                    regex: "\\b(actor|any|associatedtype|async|await|as(\\?|!)?|break|case|catch|class|continue|convenience|default|defer|deinit|didSet|distributed|do|dynamic|else|enum|extension|fallthrough|fileprivate(\\(set\\))?|final|for|func|get|guard|if|import|indirect|infix|init(\\?|!)?|inout|internal(\\(set\\))?|in|is|isolated|nonisolated|lazy|let|mutating|nonmutating|open(\\(set\\))?|operator|optional|override|postfix|precedencegroup|prefix|private(\\(set\\))?|protocol|public(\\(set\\))?|repeat|required|rethrows|return|set|some|static|struct|subscript|super|switch|throws|throw|try(\\?|!)?|typealias|unowned(safe|unsafe)?|var|weak|where|while|willSet)\\b"),

            Pattern(name: "literals",
                    kind: .keyword,
                    regex: "\\b(true|false|nil)\\b"),
            
            Pattern(name: "precedencegroupKeywords",
                    kind: .keyword,
                    regex: "\\b(assignment|associativity|higherThan|left|lowerThan|none|right)\\b"),
            
            Pattern(name: "numberSignKeywords",
                    kind: .keyword,
                    regex: "#(colorLiteral|column|dsohandle|else|elseif|endif|error|file|fileID|fileLiteral|filePath|function|if|imageLiteral|keyPath|line|selector|sourceLocation|warn_unqualified_access|warning)\\b"),
            
            Pattern(name: "keywordAttributes",
                    kind: .keyword,
                    regex: "@(autoclosure|convention|discardableResult|dynamicCallable|dynamicMemberLookup|escaping|frozen|GKInspectable|IBAction|IBDesignable|IBInspectable|IBOutlet|IBSegueAction|inlinable|main|nonobjc|NSApplicationMain|NSCopying|NSManaged|objc|objc|objcMembers|propertyWrapper|requires_stored_property_inits|resultBuilder|testable|UIApplicationMain|unknown|usableFromInline)\\b"),
            
            Pattern(name: "strings",
                    kind: .string,
                    regex: "(\".*\")"),
            
            Pattern(name: "commentLine",
                    kind: .comment,
                    regex: "(//.*)"),
            
            Pattern(name: "commentBlock",
                    kind: .comment,
                    regex: "(/\\*.*?\\*/)")
            ]
    }
    
    public var exclusivePatterns: [Pattern] {
        return []
    }
    
}

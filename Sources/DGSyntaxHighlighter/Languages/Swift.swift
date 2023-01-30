//
//  Swift.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Swift: Language {

    public var inlineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(name: "keywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(actor|any|associatedtype|async|await|as(\\?|!)?|break|case|catch|class|continue|convenience|default|defer|deinit|didSet|distributed|do|dynamic|else|enum|extension|fallthrough|fileprivate(\\(set\\))?|final|for|func|get|guard|if|import|indirect|infix|init(\\?|!)?|inout|internal(\\(set\\))?|in|is|isolated|nonisolated|lazy|let|mutating|nonmutating|open(\\(set\\))?|operator|optional|override|postfix|precedencegroup|prefix|private(\\(set\\))?|protocol|public(\\(set\\))?|repeat|required|rethrows|return|set|some|static|struct|subscript|super|switch|throws|throw|try(\\?|!)?|typealias|unowned(safe|unsafe)?|var|weak|where|while|willSet)\\b")
                             ]),

            SyntaxDescriptor(name: "literals",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(true|false|nil)\\b")
                             ]),
            
            SyntaxDescriptor(name: "precedencegroupKeywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "\\b(assignment|associativity|higherThan|left|lowerThan|none|right)\\b")
                             ]),
            
            SyntaxDescriptor(name: "numberSignKeywords",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "#(colorLiteral|column|dsohandle|else|elseif|endif|error|file|fileID|fileLiteral|filePath|function|if|imageLiteral|keyPath|line|selector|sourceLocation|warn_unqualified_access|warning)\\b")
                             ]),
            
            SyntaxDescriptor(name: "keywordAttributes",
                             kind: .keyword,
                             rules: [
                                SyntaxRule(pattern: "@(autoclosure|convention|discardableResult|dynamicCallable|dynamicMemberLookup|escaping|frozen|GKInspectable|IBAction|IBDesignable|IBInspectable|IBOutlet|IBSegueAction|inlinable|main|nonobjc|NSApplicationMain|NSCopying|NSManaged|objc|objc|objcMembers|propertyWrapper|requires_stored_property_inits|resultBuilder|testable|UIApplicationMain|unknown|usableFromInline)\\b")
                             ]),
            
            SyntaxDescriptor(name: "string",
                             kind: .string,
                             rules: [
                                SyntaxRule(pattern: "\".*\"")
                             ]),
            
            SyntaxDescriptor(name: "commentLine",
                             kind: .comment,
                             rules: [
                                SyntaxRule(pattern: "//.*")
                             ])
            ]
    }
    
    public var multilineDescriptors: [SyntaxDescriptor] {
        return [
            SyntaxDescriptor(name: "stringBlock",
                             kind: .string,
                             rules: [
                                SyntaxRule(pattern: "(\\\"{3})(?!\\\")[\\s\\S]*?\\1")]),
            
            SyntaxDescriptor(name: "commentBlock",
                             kind: .comment,
                             rules: [
                                SyntaxRule(pattern: "/\\*[\\s\\S]*?\\*/")
                             ])
        ]
    }
    
}

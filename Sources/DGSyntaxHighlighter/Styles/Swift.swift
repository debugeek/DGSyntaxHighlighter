//
//  Swift.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Swift: Style {

    public var patterns: [Pattern] {
        return [
            Pattern(name: "keywords",
                    regex: "\\b(actor|any|associatedtype|async|await|as(\\?|!)?|break|case|catch|class|continue|convenience|default|defer|deinit|didSet|distributed|do|dynamic|else|enum|extension|fallthrough|fileprivate(\\(set\\))?|final|for|func|get|guard|if|import|indirect|infix|init(\\?|!)?|inout|internal(\\(set\\))?|in|is|isolated|nonisolated|lazy|let|mutating|nonmutating|open(\\(set\\))?|operator|optional|override|postfix|precedencegroup|prefix|private(\\(set\\))?|protocol|public(\\(set\\))?|repeat|required|rethrows|return|set|some|static|struct|subscript|super|switch|throws|throw|try(\\?|!)?|typealias|unowned(safe|unsafe)?|var|weak|where|while|willSet)\\b",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC5FA3)),

            Pattern(name: "literals",
                    regex: "\\b(true|false|nil)\\b",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC5FA3)),
            
            Pattern(name: "precedencegroupKeywords",
                    regex: "\\b(assignment|associativity|higherThan|left|lowerThan|none|right)\\b",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC5FA3)),
            
            Pattern(name: "numberSignKeywords",
                    regex: "#(colorLiteral|column|dsohandle|else|elseif|endif|error|file|fileID|fileLiteral|filePath|function|if|imageLiteral|keyPath|line|selector|sourceLocation|warn_unqualified_access|warning)\\b",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC5FA3)),
            
            Pattern(name: "keywordAttributes",
                    regex: "@(autoclosure|convention|discardableResult|dynamicCallable|dynamicMemberLookup|escaping|frozen|GKInspectable|IBAction|IBDesignable|IBInspectable|IBOutlet|IBSegueAction|inlinable|main|nonobjc|NSApplicationMain|NSCopying|NSManaged|objc|objc|objcMembers|propertyWrapper|requires_stored_property_inits|resultBuilder|testable|UIApplicationMain|unknown|usableFromInline)\\b",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC5FA3)),
            
            Pattern(name: "strings",
                    regex: "(\".*\")",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFC6A5D)),
            
            Pattern(name: "commentLine",
                    regex: "(//.*)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0x6C7986)),
            
            Pattern(name: "commentBlock",
                    regex: "(/\\*.*?\\*/)",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0x6C7986))
            ]
    }
    
}

//
//  SyntaxDescriptor.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct SyntaxRule {
    let pattern: String
    let anchorsMatchLines: Bool
    public init(pattern: String, anchorsMatchLines: Bool = false) {
        self.pattern = pattern
        self.anchorsMatchLines = anchorsMatchLines
    }
}

public struct SyntaxDescriptor {
    
    public enum Kind {
        case text
        case keyword
        case string
        case comment
        case emphasis
        case link
    }
    
    public let name: String
    public let kind: Kind
    public let rules: [SyntaxRule]
    
}

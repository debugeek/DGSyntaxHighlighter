//
//  Pattern.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public enum Kind {
    case text
    case keyword
    case string
    case comment
    case emphasis
    case link
}

public struct Pattern {
    public let name: String
    public let kind: Kind
    public let regex: String
}

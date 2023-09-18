//
//  SyntaxDescriptor.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct SyntaxMatchingResult {
    let range: NSRange
    let reservedRanges: [NSRange]
}

public struct SyntaxRule {

    let pattern: String
    let reservingHints: [Int]
    let anchorsMatchLines: Bool
    let regex: NSRegularExpression?

    public init(pattern: String, reservingHints: [Int] = [], anchorsMatchLines: Bool = false) {
        self.pattern = pattern
        self.reservingHints = reservingHints
        self.anchorsMatchLines = anchorsMatchLines
        self.regex = anchorsMatchLines ? try? NSRegularExpression(pattern: pattern, options: .anchorsMatchLines) : try? NSRegularExpression(pattern: pattern)
    }
    
    public func matches(in string: String, range: NSRange) -> [SyntaxMatchingResult] {
        guard let matches = regex?.matches(in: string, range: range) else { return [] }

        return matches.map { match in
            let reservedRanges = reservingHints
                .filter { $0 < match.numberOfRanges }
                .map { match.range(at: $0) }
            return SyntaxMatchingResult(range: match.range, reservedRanges: reservedRanges)
        }
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
        case heading
    }
    
    public let name: String
    public let kind: Kind
    public let rules: [SyntaxRule]

    public init(name: String, kind: Kind, rules: [SyntaxRule]) {
        self.name = name
        self.kind = kind
        self.rules = rules
    }

}

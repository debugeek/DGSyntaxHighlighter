//
//  SyntaxDescriptor.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public protocol SyntaxCapture {
    var range: NSRange { get }
    init(range: NSRange)
}

public struct SyntaxCaptureDescriptor<T> {
    let capture: (NSTextCheckingResult) -> T
}

extension SyntaxCaptureDescriptor where T: SyntaxCapture {
    init(mapping: [Int: WritableKeyPath<T, NSRange?>]) {
        self.capture = { match in
            var instance = T(range: match.range(at: 0))
            for (index, keyPath) in mapping {
                if index < match.numberOfRanges {
                    instance[keyPath: keyPath] = match.range(at: index)
                }
            }
            return instance
        }
    }
}

public struct AnySyntaxCaptureDescriptor {
    private let createFunc: (NSTextCheckingResult) -> Any

    public init<T>(_ underlyingDescriptor: SyntaxCaptureDescriptor<T>) {
        self.createFunc = { underlyingDescriptor.capture($0) }
    }

    public func create(from match: NSTextCheckingResult) -> Any {
        createFunc(match)
    }
}

public struct SyntaxMatchingResult {
    public let range: NSRange
    public let reservedRanges: [NSRange]
    public let capture: SyntaxCapture?
}

public struct SyntaxRule {

    let pattern: String
    let reservingHints: [Int]
    let anchorsMatchLines: Bool
    let captureDescriptor: AnySyntaxCaptureDescriptor?

    let regex: NSRegularExpression?

    public init<T: SyntaxCapture>(
        pattern: String,
        reservingHints: [Int] = [],
        anchorsMatchLines: Bool = false,
        captureDescriptor: SyntaxCaptureDescriptor<T>
    ) {
        self.pattern = pattern
        self.reservingHints = reservingHints
        self.anchorsMatchLines = anchorsMatchLines
        self.captureDescriptor = AnySyntaxCaptureDescriptor(captureDescriptor)
        self.regex = anchorsMatchLines ? try? NSRegularExpression(pattern: pattern, options: .anchorsMatchLines) : try? NSRegularExpression(pattern: pattern)
    }

    public init(
        pattern: String,
        reservingHints: [Int] = [],
        anchorsMatchLines: Bool = false
    ) {
        self.pattern = pattern
        self.reservingHints = reservingHints
        self.anchorsMatchLines = anchorsMatchLines
        self.captureDescriptor = nil
        self.regex = anchorsMatchLines ? try? NSRegularExpression(pattern: pattern, options: .anchorsMatchLines) : try? NSRegularExpression(pattern: pattern)
    }

    public func matches(in string: String, range: NSRange) -> [SyntaxMatchingResult] {
        guard
            let matches = regex?.matches(in: string, range: range)
        else {
            return []
        }

        return matches.map { match in
            let reservedRanges = reservingHints
                .filter { $0 < match.numberOfRanges }
                .map { match.range(at: $0) }
            return SyntaxMatchingResult(range: match.range,
                                        reservedRanges: reservedRanges,
                                        capture: captureDescriptor?.create(from: match) as? SyntaxCapture)
        }
    }
    
}

public struct SyntaxDescriptor {
    
    public let kind: Kind
    public let rules: [SyntaxRule]?
    init(kind: Kind, rules: [SyntaxRule]? = nil) {
        self.kind = kind
        self.rules = rules
    }

    static let plain = SyntaxDescriptor(kind: .plain)

}

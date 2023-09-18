//
//  DGSyntaxHighlighter.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation
import DGExtension

public struct DGSyntaxHighlighter {

    public enum Identifier: String {
        case plain = "plain"
        case markdown = "markdown"
        case swift = "swift"
        case oc = "objective-c"
        case shell = "shell"
    }

    public struct Options: OptionSet {
        public let rawValue: Int

        public init(rawValue: Int) { self.rawValue = rawValue }

        public static let plain = Options(rawValue: 1 << 0)
        public static let inline = Options(rawValue: 1 << 1)
        public static let multiline = Options(rawValue: 1 << 2)
        public static let all: Options = [.plain, .inline, .multiline]
    }
    
    let identifier: Identifier
    
    let language: Language

    let styleSheet: DGSyntaxHighlighterStyleSheet

    private let additionalInlineDescriptors: [SyntaxDescriptor]?
    private let additionalMultilineDescriptors: [SyntaxDescriptor]?

    public init(identifier: Identifier = .plain,
                styleSheet: DGSyntaxHighlighterStyleSheet = DGSyntaxHighlighterStyleSheet(),
                additionalInlineDescriptors: [SyntaxDescriptor]? = nil,
                additionalMultilineDescriptors: [SyntaxDescriptor]? = nil) {
        self.language = Self.language(forIdentifier: identifier)
        self.identifier = identifier
        self.styleSheet = styleSheet
        self.additionalInlineDescriptors = additionalInlineDescriptors
        self.additionalMultilineDescriptors = additionalMultilineDescriptors
    }
    
    public struct Attribute {
        public let style: Style
        public let range: NSRange
    }
    
    public func highlighted(string: String, options: Options) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        highlight(string: string, range: NSMakeRange(0, string.utf16.count), options: options)?.forEach {
            attributedString.addAttributes([.font: $0.style.font as Any, .foregroundColor: $0.style.foregroundColor as Any], range: $0.range)
        }
        return attributedString
    }
    
    public func highlight(string: String, range: NSRange, options: Options) -> [Attribute]? {
        var attributes = [Attribute]()

        if options.contains(.plain) {
            let style = styleSheet.style(forKind: .text)
            attributes.append(Attribute(style: style, range: range))
        }

        var effectiveRanges: [NSRange] = [range]

        var descriptors = [SyntaxDescriptor]()
        if options.contains(.multiline) {
            descriptors.append(contentsOf: language.multilineDescriptors)
            if let additionalMultilineDescriptors = additionalMultilineDescriptors {
                descriptors.append(contentsOf: additionalMultilineDescriptors)
            }
        }
        if options.contains(.inline) {
            descriptors.append(contentsOf: language.inlineDescriptors)
            if let additionalInlineDescriptors = additionalInlineDescriptors {
                descriptors.append(contentsOf: additionalInlineDescriptors)
            }
        }

        for descriptor in descriptors {
            let style = styleSheet.style(forKind: descriptor.kind)
            for rule in descriptor.rules {
                for effectiveRange in effectiveRanges {
                    let matches = rule.matches(in: string, range: effectiveRange)
                    if matches.count == 0 { continue }

                    let ranges = matches.map { $0.range }
                    for range in ranges {
                        attributes.append(Attribute(style: style, range: range))
                    }

                    let reservedRanges = matches.flatMap({ $0.reservedRanges })
                    if reservedRanges.count == 0 { continue }
                    for reservedRange in reservedRanges {
                        effectiveRanges.removeAll(where: { $0.intersection(reservedRange) != nil })
                    }
                    effectiveRanges.append(contentsOf: effectiveRange.subranges(byExcludingRanges: reservedRanges))
                }
            }
        }

        return attributes
    }

    public static func language(forIdentifier identifier: Identifier) -> Language {
        switch identifier {
        case .markdown: return Markdown()
        case .swift: return Swift()
        case .oc: return ObjectiveC()
        case .shell: return Shell()
        default: return Plain()
        }
    }
    
}

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

    let styleSheet: StyleSheet

    private let additionalInlineDescriptors: [SyntaxDescriptor]?
    private let additionalMultilineDescriptors: [SyntaxDescriptor]?

    public init(identifier: Identifier = .plain,
                styleSheet: StyleSheet = .default,
                additionalInlineDescriptors: [SyntaxDescriptor]? = nil,
                additionalMultilineDescriptors: [SyntaxDescriptor]? = nil) {
        self.language = Self.language(forIdentifier: identifier)
        self.identifier = identifier
        self.styleSheet = styleSheet
        self.additionalInlineDescriptors = additionalInlineDescriptors
        self.additionalMultilineDescriptors = additionalMultilineDescriptors
    }
    
    public struct SyntaxAttribute {
        public let range: NSRange
        public let kind: Kind
        public let style: Style?
        public init(range: NSRange, kind: Kind, style: Style?) {
            self.range = range
            self.kind = kind
            self.style = style
        }
    }

    public func attributedString(for string: String, options: Options) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        attributes(for: string, range: NSMakeRange(0, string.utf16.count), options: options)?.forEach {
            var attributes = [NSAttributedString.Key: Any]()
            if let font = $0.style?.font {
                attributes[.font] = font
            }
            if let foregroundColor = $0.style?.foregroundColor {
                attributes[.foregroundColor] = foregroundColor
            }
            attributedString.addAttributes(attributes, range: $0.range)
        }
        return attributedString
    }
    
    public func attributes(for string: String, range: NSRange, options: Options) -> [SyntaxAttribute]? {
        var attributes = [SyntaxAttribute]()

        if options.contains(.plain) {
            attributes.append(SyntaxAttribute(range: range, kind: .text, style: styleSheet.style(for: .text)))
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
            for rule in descriptor.rules {
                for effectiveRange in effectiveRanges {
                    let matches = rule.matches(in: string, range: effectiveRange)
                    if matches.count == 0 { continue }

                    attributes.append(contentsOf: matches.map {
                        SyntaxAttribute(range: $0.range, kind: descriptor.kind, style: styleSheet.style(for: descriptor.kind))
                    })

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

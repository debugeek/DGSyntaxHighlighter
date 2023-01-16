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

    public init(identifier: Identifier = .plain,
                styleSheet: DGSyntaxHighlighterStyleSheet = DGSyntaxHighlighterStyleSheet()) {
        self.language = Self.language(forIdentifier: identifier)
        self.identifier = identifier
        self.styleSheet = styleSheet
    }
    
    public struct Attribute {
        public let style: Style
        public let range: NSRange
    }
    
    public func highlighted(string: String, options: Options) -> AttributedString {
        var attributedString = AttributedString(string)
        highlight(string: string, range: NSMakeRange(0, (string as NSString).length), options: options)?.forEach {
            guard let range = Range($0.range, in: attributedString) else { return }
            attributedString[range].font = $0.style.font
            attributedString[range].foregroundColor = $0.style.foregroundColor
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

        if options.contains(.multiline) {
            for pattern in language.multilinePatterns {
                guard let regex = try? NSRegularExpression(pattern: pattern.regex, options: .anchorsMatchLines) else {
                    continue
                }
                
                let style = styleSheet.style(forKind: pattern.kind)
                
                for effectiveRange in effectiveRanges {
                    let ranges = regex.matches(in: string, range: effectiveRange).map { $0.range }
                    if ranges.count == 0 {
                        continue
                    }
                    
                    for range in ranges {
                        attributes.append(Attribute(style: style, range: range))
                        effectiveRanges.removeAll(where: { $0.intersection(range) != nil })
                    }
                    
                    effectiveRanges.append(contentsOf: effectiveRange.subranges(byExcludingRanges: ranges))
                }
            }
        }

        if options.contains(.inline) {
            for effectiveRange in effectiveRanges {
                for pattern in language.inlinePatterns {
                    guard let regex = try? NSRegularExpression(pattern: pattern.regex, options: .anchorsMatchLines) else {
                        continue
                    }

                    let style = styleSheet.style(forKind: pattern.kind)

                    let ranges = regex.matches(in: string, range: effectiveRange).map { $0.range }
                    for range in ranges {
                        attributes.append(Attribute(style: style, range: range))
                    }
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

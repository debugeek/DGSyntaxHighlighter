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
    }

    public struct Attribute {
        public let style: Style
        public let range: NSRange
    }
    
    public static func highlighted(string: String, identifier: Identifier) -> AttributedString {
        var attributedString = AttributedString(string)
        highlight(string: string, range: NSMakeRange(0, (string as NSString).length), identifier: identifier)?.forEach {
            guard let range = Range($0.range, in: attributedString) else { return }
            attributedString[range].font = $0.style.font
            attributedString[range].foregroundColor = $0.style.foregroundColor
        }
        return attributedString
    }
    
    public static func highlight(string: String, range: NSRange, identifier: Identifier) -> [Attribute]? {
        guard let language = language(forIdentifier: identifier) else { return nil }

        var attributes = [Attribute]()

        var effectiveRanges: [NSRange] = [range]

        for pattern in language.exclusivePatterns {
            guard let regex = try? NSRegularExpression(pattern: pattern.regex, options: .anchorsMatchLines) else {
                continue
            }
            
            let style = Style.style(forKind: pattern.kind)
            
            for effectiveRange in effectiveRanges {
                let results = regex.matches(in: string, range: effectiveRange)
                if results.count == 0 {
                    continue
                }
                
                let ranges = results.map { $0.range }
                for range in ranges {
                    attributes.append(Attribute(style: style, range: range))
                    effectiveRanges.removeAll(where: { $0.intersection(range) != nil })
                }
                
                effectiveRanges.append(contentsOf: effectiveRange.subranges(byExcludingRanges: ranges))
            }
        }

        for effectiveRange in effectiveRanges {
            for pattern in language.defaultPatterns {
                guard let regex = try? NSRegularExpression(pattern: pattern.regex, options: .anchorsMatchLines) else {
                    continue
                }

                let style = Style.style(forKind: pattern.kind)

                let results = regex.matches(in: string, range: effectiveRange)
                for result in results {
                    attributes.append(Attribute(style: style, range: result.range))
                }
            }
        }

        return attributes
    }
    
    public static func language(forIdentifier identifier: Identifier) -> Language? {
        switch identifier {
        case .markdown: return Markdown()
        case .swift: return Swift()
        case .oc: return ObjectiveC()
        default: return Plain()
        }
    }
    
}

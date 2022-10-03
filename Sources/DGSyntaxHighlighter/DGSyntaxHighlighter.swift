//
//  DGSyntaxHighlighter.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation
import DGExtension
import AppKit

public struct DGSyntaxHighlighter {

    public enum Identifier: String {
        case plain = "plain"
        case markdown = "markdown"
        case swift = "swift"
        case oc = "objective-c"
    }
    
    public static func highlighted(string: String, identifier: Identifier) -> AttributedString {
        var attributedString = AttributedString(string)
        highlight(string: string, identifier: identifier) { style, range in
            if let range = Range(range, in: attributedString) {
                attributedString[range].font = style.font
                attributedString[range].foregroundColor = style.foregroundColor
            }
        }
        return attributedString
    }
    
    public static func highlight(string: String, identifier: Identifier, callback: ((Style, NSRange) -> Void)) {
        guard let language = language(forIdentifier: identifier) else { return }
        
        var ranges: [NSRange] = [NSRange(location: 0, length: string.count)]
        for pattern in language.exclusivePatterns {
            guard let regex = try? NSRegularExpression(pattern: pattern.regex) else {
                continue
            }
            
            let style = Style.style(forKind: pattern.kind)
            
            repeat {
                var matched = false
                for range in ranges {
                    guard let result = regex.matches(in: string, range: range).first else {
                        continue
                    }
                    
                    callback(style, result.range)
                 
                    ranges.removeAll(where: { NSIntersectionRange($0, result.range).length > 0 })
                    ranges.append(NSRange(location: min(range.lowerBound, result.range.lowerBound),
                                          length: abs(range.lowerBound - result.range.lowerBound)))
                    ranges.append(NSRange(location: min(range.upperBound, result.range.upperBound),
                                          length: abs(range.upperBound - result.range.upperBound)))
                    
                    matched = true
                    break
                }
                if !matched {
                    break
                }
            } while ranges.count > 0
        }
        
        for pattern in language.patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern.regex) else {
                continue
            }
            
            let style = Style.style(forKind: pattern.kind)
            
            for range in ranges {
                let results = regex.matches(in: string, range: range)
                for result in results {
                    callback(style, result.range)
                }
            }
        }
    }
    
    public static func language(forIdentifier identifier: Identifier) -> Language? {
        switch identifier {
        case .markdown: return Markdown()
        case .swift: return Swift()
        case .oc: return ObjectiveC()
        default: return nil
        }
    }
    
}

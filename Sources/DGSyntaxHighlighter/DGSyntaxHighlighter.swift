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
    }
    
    public static func highlight(string: String, identifier: Identifier) -> AttributedString {
        var styles = [Style]()
        styles.append(Plain())
        if identifier != .plain, let style = style(forIdentifier: identifier) {
            styles.append(style)
        }
        
        var attributedString = AttributedString(string)
        
        for style in styles {
            for pattern in style.patterns {
                guard let regex = try? NSRegularExpression(pattern: pattern.regex) else {
                    continue
                }
                
                let results = regex.matches(in: string, range: NSRange(location: 0, length: string.count))
                for result in results {
                    guard let range = Range(result.range, in: attributedString) else {
                        continue
                    }
                    attributedString[range].font = pattern.font
                    attributedString[range].foregroundColor = pattern.foregroundColor
                }
            }
        }
        
        return attributedString
    }
    
    public static func style(forIdentifier identifier: Identifier) -> Style? {
        switch identifier {
        case .swift: return Swift()
        case .markdown: return Markdown()
        default: return Plain()
        }
    }
    
}

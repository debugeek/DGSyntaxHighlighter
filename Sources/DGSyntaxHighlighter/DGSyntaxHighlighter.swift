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
    
    public static func highlight(string: String, identifier: Identifier) -> AttributedString {
        var languages = [Language]()
        languages.append(Plain())
        if identifier != .plain, let language = language(forIdentifier: identifier) {
            languages.append(language)
        }
        
        var attributedString = AttributedString(string)
        
        for language in languages {
            for pattern in language.patterns {
                guard let regex = try? NSRegularExpression(pattern: pattern.regex) else {
                    continue
                }
                
                let style = Style.style(forKind: pattern.kind)
                
                let results = regex.matches(in: string, range: NSRange(location: 0, length: string.count))
                for result in results {
                    guard let range = Range(result.range, in: attributedString) else {
                        continue
                    }
                    attributedString[range].font = style.font
                    attributedString[range].foregroundColor = style.foregroundColor
                }
            }
        }
        
        return attributedString
    }
    
    public static func language(forIdentifier identifier: Identifier) -> Language? {
        switch identifier {
        case .swift: return Swift()
        case .markdown: return Markdown()
        case .oc: return ObjectiveC()
        default: return nil
        }
    }
    
}

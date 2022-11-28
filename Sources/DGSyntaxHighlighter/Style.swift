//
//  Style.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation
import DGExtension

#if canImport(Cocoa)
import Cocoa
public typealias Font = NSFont
public typealias Color = NSColor
#elseif canImport(UIKit)
import UIKit
public typealias Font = UIFont
public typealias Color = UIColor
#endif

public struct StyleSheet {
    public var text: Style
    public var keyword: Style
    public var string: Style
    public var comment: Style
    public var emphasis: Style
    public var link: Style

    init() {
#if canImport(Cocoa)
        let textColor = Color.textColor
#elseif canImport(UIKit)
        let textColor = Color.label
#endif

        text = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                     foregroundColor: textColor)
        keyword = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                        foregroundColor: Color.color(withHex: 0xFC5FA3))
        string = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                       foregroundColor: Color.color(withHex: 0xFC6A5D))
        comment = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                        foregroundColor: Color.color(withHex: 0x6C7986))
        emphasis = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                         foregroundColor: Color.color(withHex: 0x5DD8FF))
        link = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                     foregroundColor: Color.color(withHex: 0x5DD8FF))
    }
}

extension StyleSheet {
    public func style(forKind kind: Kind) -> Style {
        switch kind {
        case .text: return text
        case .keyword: return keyword
        case .string: return string
        case .comment: return comment
        case .emphasis: return emphasis
        case .link: return link
        }
    }
}

public struct Style {
    public var font: Font?
    public var foregroundColor: Color?
}

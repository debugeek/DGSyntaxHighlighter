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

    private(set) public var styles = [Kind: Style]()

    public init() {}

    public static var `default`: StyleSheet {
        get {
            var styleSheet = StyleSheet()
#if canImport(Cocoa)
            styleSheet.addStyle(Style(kind: .text, font: Font.systemFont(ofSize: 16), foregroundColor: Color.textColor))
#elseif canImport(UIKit)
            styleSheet.addStyle(Style(kind: .text, font: Font.systemFont(ofSize: 16), foregroundColor: Color.label))
#endif
            return styleSheet
        }
    }

    public mutating func addStyle(_ style: Style) {
        styles[style.kind] = style
    }

    public func style(for kind: Kind) -> Style? {
        return styles[kind]
    }

}

public struct Style {
    public let kind: Kind
    public let font: Font?
    public let foregroundColor: Color?
    public init(kind: Kind, font: Font? = nil, foregroundColor: Color? = nil) {
        self.kind = kind
        self.font = font
        self.foregroundColor = foregroundColor
    }
}

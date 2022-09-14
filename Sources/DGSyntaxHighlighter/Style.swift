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

struct Style {
    
    let font: Font?
    let foregroundColor: Color?
    
    static let text = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                            foregroundColor: Color.color(withHex: 0xFFFFFF, alpha: 0.85))
    
    static let keyword = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                               foregroundColor: Color.color(withHex: 0xFC5FA3))
                               
    static let string = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                              foregroundColor: Color.color(withHex: 0xFC6A5D))
    
    static let comment = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                               foregroundColor: Color.color(withHex: 0x6C7986))
    
    static let emphasis = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                                foregroundColor: Color.color(withHex: 0x5DD8FF))
    
    static let link = Style(font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                            foregroundColor: Color.color(withHex: 0x5DD8FF))

}

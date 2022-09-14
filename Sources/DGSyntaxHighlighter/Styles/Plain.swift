//
//  Plain.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct Plain: Style {
    
    public var patterns: [Pattern] {
        return [
            Pattern(name: "plain",
                    regex: ".*",
                    font: Font.monospacedSystemFont(ofSize: 16, weight: .regular),
                    foregroundColor: Color.color(withHex: 0xFFFFFF, alpha: 0.85))
        ]
    }
    
}

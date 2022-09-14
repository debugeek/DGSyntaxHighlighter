//
//  Language.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/14.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public protocol Language {
    
    var patterns: [Pattern] { get }
    
}

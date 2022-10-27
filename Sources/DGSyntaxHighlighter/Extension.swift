//
//  Extension.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/10/27.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

extension NSRange {

    func subranges(byExcludingRanges ranges: [NSRange]) -> [NSRange] {
        var subranges = [NSRange]()

        var lowerBound = lowerBound
        var upperBound = upperBound

        var left: NSRange?
        var right: NSRange?
        
        for range in ranges {
            left = nil
            right = nil
            
            if self.intersection(range) == nil { continue }
            if range.location <= lowerBound && upperBound <= range.upperBound { return [] }

            if lowerBound < range.lowerBound {
                left = NSMakeRange(lowerBound, range.lowerBound - lowerBound)
            }

            if upperBound > range.upperBound {
                right = NSMakeRange(range.upperBound, upperBound - range.upperBound)
            }

            if let left = left {
                subranges.append(left)
            }
            
            if let right = right {
                lowerBound = right.lowerBound
                upperBound = right.upperBound
            }
        }

        if let right = right {
            subranges.append(right)
        }

        return subranges
    }

}

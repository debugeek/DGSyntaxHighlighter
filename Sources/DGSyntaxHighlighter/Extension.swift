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
        var subranges = [self]
        
        for range in ranges {
            let temp = subranges
            subranges.removeAll()
            
            for subrange in temp {
                guard let intersection = subrange.intersection(range) else {
                    subranges.append(subrange)
                    continue
                }
                
                if intersection.lowerBound <= subrange.lowerBound, intersection.upperBound >= subrange.upperBound {
                    continue
                }
                
                if subrange.lowerBound < range.lowerBound {
                    subranges.append(NSRange(subrange.lowerBound..<range.lowerBound))
                }
                
                if subrange.upperBound > range.upperBound {
                    subranges.append(NSRange(range.upperBound..<subrange.upperBound))
                }
            }
        }
        
        return subranges
    }

}

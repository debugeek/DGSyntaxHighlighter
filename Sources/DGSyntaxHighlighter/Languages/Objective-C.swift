//
//  Objective-C.swift
//  DGSyntaxHighlighter
//
//  Created by Xiao Jin on 2022/9/19.
//  Copyright © 2022 debugeek. All rights reserved.
//

import Foundation

public struct ObjectiveC: Language {

    public var inlinePatterns: [Pattern] {
        return [
            Pattern(name: "framework",
                    kind: .emphasis,
                    regex: "\\b(AV|CA|CF|CG|CI|CL|CM|CN|CT|MK|MP|MTK|MTL|NS|SCN|SK|UI|WK|XC)\\w+"),
        
            Pattern(name: "types",
                    kind: .keyword,
                    regex: "\\b(int|float|char|unsigned|signed|short|long|double|wchar_t|unichar|void|bool|BOOL|id|_Bool)\\b"),
            
            Pattern(name: "keywords",
                    kind: .keyword,
                    regex: "\\b(while|export|sizeof|typedef|const|struct|for|union|volatile|static|mutable|if|do|return|goto|enum|else|break|extern|asm|case|default|register|explicit|typename|switch|continue|inline|readonly|assign|readwrite|self|this|super|@synchronized|typeof|nonatomic|IBOutlet|IBAction|strong|weak|copy|in|out|inout|bycopy|byref|oneway|__strong|__weak|__block|__autoreleasing|@private|@protected|@public|@try|@property|@end|@throw|@catch|@finally|@autoreleasepool|@synthesize|@dynamic|@selector|@optional|@required|@encode|@package|@import|@defs|@compatibility_alias|__bridge|__bridge_transfer|__bridge_retained|__bridge_retain|__covariant|__contravariant|__kindof|_Nonnull|_Nullable|_Null_unspecified|__FUNCTION__|__PRETTY_FUNCTION__|__attribute__|getter|setter|retain|unsafe_unretained|nonnull|nullable|null_unspecified|null_resettable|class|instancetype|NS_DESIGNATED_INITIALIZER|NS_UNAVAILABLE|NS_REQUIRES_SUPER|NS_RETURNS_INNER_POINTER|NS_INLINE|NS_AVAILABLE|NS_DEPRECATED|NS_ENUM|NS_OPTIONS|NS_SWIFT_UNAVAILABLE|NS_ASSUME_NONNULL_BEGIN|NS_ASSUME_NONNULL_END|NS_REFINED_FOR_SWIFT|NS_SWIFT_NAME|NS_SWIFT_NOTHROW|NS_DURING|NS_HANDLER|NS_ENDHANDLER|NS_VALUERETURN|NS_VOIDRETURN|@interface|@class|@protocol|@implementation)\\b"),
            
            Pattern(name: "literals",
                    kind: .emphasis,
                    regex: "\\b(false|true|FALSE|TRUE|nil|YES|NO|NULL)\\b"),
            
            Pattern(name: "strings",
                    kind: .string,
                    regex: "(\".*\")"),
            
            Pattern(name: "commentLine",
                    kind: .comment,
                    regex: "(//.*)"),
            
            Pattern(name: "commentBlock",
                    kind: .comment,
                    regex: "(/\\*.*?\\*/)")
            ]
    }
    
    public var multilinePatterns: [Pattern] {
        return []
    }
    
}



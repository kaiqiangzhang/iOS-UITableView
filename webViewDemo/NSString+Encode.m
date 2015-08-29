//
//  NSString+Encode.m
//  webViewDemo
//
//  Created by kris on 15/7/2.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Encode.h"
//@implementation NSString (encode)
//- (NSString *)encodeString:(NSStringEncoding)encoding
//{
//    return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self,
//                                                                NULL, (CFStringRef)@";/?:@&=$+{}<>,",
//                                                                CFStringConvertNSStringEncodingToEncoding(encoding)));
//}  
//@end
@implementation NSString (URLEncoding)
- (NSString *)URLEncodedString{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,CFSTR("!*'();:@&amp;=+$,/?%#[] "),kCFStringEncodingUTF8));
    return result;
}

- (NSString*)URLDecodedString{
    {
        
        NSString *result = (NSString *)
        
        CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding
                          
                          (kCFAllocatorDefault,
                           
                           (CFStringRef)self, CFSTR(""),
                           
                           kCFStringEncodingUTF8));  
        
        return result;  
        
    }
//    NSString *result = (NSString *)CFBridgingRelease                                 (CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault(CFStringRef)self,CFSTR(""),kCFStringEncodingUTF8));
//    return result;
}
@end

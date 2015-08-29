//
//  NSString+Encode.h
//  webViewDemo
//
//  Created by kris on 15/7/2.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#ifndef webViewDemo_NSString_Encode_h
#define webViewDemo_NSString_Encode_h
//@interface NSString (encode)
////- (NSString *)encodeString:(NSStringEncoding)encoding;
//- (NSString *)URLEncodedString;
//- (NSString*)URLDecodedString;
//@end
@interface NSString (URLEncoding)



-(NSString *)URLEncodedString;

-(NSString *)URLDecodedString;



@end
#endif

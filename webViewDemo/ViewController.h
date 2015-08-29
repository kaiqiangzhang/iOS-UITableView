//
//  ViewController.h
//  webViewDemo
//
//  Created by kris on 15/6/26.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView2;

- (IBAction)testLoadData:(id)sender;

- (IBAction)testLoadHtmlString:(id)sender ;

- (IBAction)testLoadRequest:(id)sender ;


@property (weak, nonatomic) IBOutlet UIButton *testLoadData;
@property (weak, nonatomic) IBOutlet UIButton *testLoadHtmlBut;
@property (weak, nonatomic) IBOutlet UIButton *testLoadRequestBtn;

@end


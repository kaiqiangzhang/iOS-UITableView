//
//  ViewController.m
//  webViewDemo
//
//  Created by kris on 15/6/26.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Encode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad: (UIWebView *) webView {
    NSLog(@"%@", [webView stringByEvaluatingJavaScriptFromString: @"document.body.innerHTML"]);
    [self.webView2 stringByEvaluatingJavaScriptFromString:@"helloWebview('ios代码里调用javascript函数!')"];
}

- (IBAction)testLoadData:(id)sender {
    NSString *htmlPath=[[NSBundle mainBundle] pathForResource:@"www/index" ofType:@"html"];
    NSURL *bundleUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *err=nil;
    NSData *htmlData=[[NSData alloc] initWithContentsOfFile:htmlPath];
    if (err==nil) {
        [self.webView2 loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:bundleUrl];
    }
}


- (IBAction)testLoadHtmlString:(id)sender {
    NSString *htmlPath=[[NSBundle mainBundle] pathForResource:@"www/index" ofType:@"html"];
   
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;
    NSString *html = [[NSString alloc] initWithContentsOfFile:
                      htmlPath encoding: NSUTF8StringEncoding error:&error];
    if (error == nil) {//如果没有错误
        [self.webView2 loadHTMLString:html baseURL:bundleUrl];
    }
}


- (IBAction)testLoadRequest:(id)sender {
    NSURL * url = [NSURL URLWithString: @"https://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView2 loadRequest:request];
    self.webView2.delegate = self;
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
                    [self.webView2 stringByEvaluatingJavaScriptFromString:@"helloWebview('ios代码里调用javascript函数!')"];
    NSString *action=request.URL.host;
    NSString *scheme=request.URL.scheme;
    NSString *fragment=[request.URL.fragment URLDecodedString];
    //NSString *fragment=[request.URL.fragment encodeString:NSUTF8StringEncoding];
    NSData *requstData=[fragment dataUsingEncoding:NSUTF8StringEncoding];
    if ([scheme isEqualToString:@"gap"]) {
        if([action isEqualToString:@"XXXClass.XXXmethod"]){
            NSError *error=nil;
            NSDictionary *json=[NSJSONSerialization JSONObjectWithData:requstData options:NSJSONReadingAllowFragments error:&error];
            NSLog(@"title:%@,message:%@",[json objectForKey:@"title"],[json objectForKey:@"message"]);
                [self.webView2 stringByEvaluatingJavaScriptFromString:@"helloWebview('ios代码里调用javascript函数!')"];
            
        }
    }
    return true;
}


@end

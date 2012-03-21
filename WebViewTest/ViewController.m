//
//  ViewController.m
//  WebViewTest
//
//  Created by  on 12/03/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://yahoo.jp"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"Loading: %@", [request URL]);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    return YES;
}
 */

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"didStart: %@; stillLoading:%@", [[webView request]URL],
          (webView.loading?@"YES":@"NO"));
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"didFinish: %@; stillLoading:%@", [[webView request]URL],
          (webView.loading?@"YES":@"NO"));
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFail: %@; stillLoading:%@", [[webView request]URL],
          (webView.loading?@"YES":@"NO"));
    //NSLog(@"prog : %f",[webView res] exp);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end

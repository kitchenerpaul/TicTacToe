//
//  WebViewController.m
//  TicTacToe
//
//  Created by Paul Kitchener on 10/4/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.spinner.hidesWhenStopped = YES;

    NSURL *url = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Tic-tac-toe"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];


}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
    NSLog(@"started");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
    NSLog(@"stopped");
}

- (IBAction)onBackButtonPressed:(UIBarButtonItem *)sender {
    NSLog(@"clicked");
    
}

@end

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

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.spinner.hidesWhenStopped = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://en.wikipedia.org/wiki/Tic-tac-toe"]]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
}

- (IBAction)onBackButtonPressed:(UIBarButtonItem *)sender {    
}

@end

//
//  WebViewController.m
//  GithubClient
//
//  Created by Gerard Gonzalez on 7/11/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSURL *url;
@end

@implementation WebViewController

- (id)initWithURL:(NSString *)URL {
    if (self = [super init]) {
        _webView = [[UIWebView alloc] init];
        _url = [NSURL URLWithString:URL];
    }
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    [self.view addSubview:self.webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:urlRequest];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.webView.frame = self.view.frame;
}

@end

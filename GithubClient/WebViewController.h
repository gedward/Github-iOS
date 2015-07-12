//
//  WebViewController.h
//  GithubClient
//
//  Created by Gerard Gonzalez on 7/11/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

- (id)initWithURL:(NSString *)URL;

@end

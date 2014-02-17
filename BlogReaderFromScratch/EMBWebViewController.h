//
//  EMBWebViewController.h
//  BlogReaderFromScratch
//
//  Created by Sean Hunter on 2/16/14.
//  Copyright (c) 2014 Embaucha LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMBWebViewController : UIViewController

@property (nonatomic, strong) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

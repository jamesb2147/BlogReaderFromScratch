//
//  EMBWebViewController.m
//  BlogReaderFromScratch
//
//  Created by Sean Hunter on 2/16/14.
//  Copyright (c) 2014 Embaucha LLC. All rights reserved.
//

#import "EMBWebViewController.h"

@interface EMBWebViewController ()

@end

@implementation EMBWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

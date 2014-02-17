//
//  EMBBlogPost.m
//  BlogReaderFromScratch
//
//  Created by Sean Hunter on 2/15/14.
//  Copyright (c) 2014 Embaucha LLC. All rights reserved.
//

#import "EMBBlogPost.h"

@implementation EMBBlogPost

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    
    [dateFormatter setDateFormat:@"EE, MMM dd yyyy"];
    return [dateFormatter stringFromDate:tempDate];
}

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.author = nil;
        self.thumbnail = nil;
        self.date = nil;
    }
    
    return self;
}

- (id) initWithTitle:(NSString *)title andAuthor:(NSString *)author {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.author = author;
        self.thumbnail = nil;
        self.date = nil;
    }
    
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}
+ (id) blogPostWithTitle:(NSString *)title andAuthor:(NSString *)author {
    return [[self alloc] initWithTitle:title andAuthor:author];
}

@end

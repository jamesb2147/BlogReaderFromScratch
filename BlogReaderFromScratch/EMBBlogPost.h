//
//  EMBBlogPost.h
//  BlogReaderFromScratch
//
//  Created by Sean Hunter on 2/15/14.
//  Copyright (c) 2014 Embaucha LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMBBlogPost : NSObject

@property (nonatomic, strong) NSString *title, *author, *date;
@property (nonatomic, strong) NSURL *thumbnail, *url;

- (NSString *) formattedDate;

- (id) initWithTitle:(NSString *)title;
- (id) initWithTitle:(NSString *)title andAuthor:(NSString *)author;

+ (id) blogPostWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title andAuthor:(NSString *)author;

@end

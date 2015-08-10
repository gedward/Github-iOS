//
//  GithubRepository.h
//  GithubClient
//
//  Created by Gerard Gonzalez on 8/9/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GithubRepository : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *repositoryDescription;
@property (nonatomic, strong, readonly) NSDate *lastUpdated;

@end

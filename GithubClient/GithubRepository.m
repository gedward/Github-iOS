//
//  GithubRepository.m
//  GithubClient
//
//  Created by Gerard Gonzalez on 8/9/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import "GithubRepository.h"

@implementation GithubRepository

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _name = dictionary[@"name"];
        _repositoryDescription = dictionary[@"description"];
    }
    return self;
}

@end

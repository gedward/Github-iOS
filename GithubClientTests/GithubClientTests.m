//
//  GithubClientTests.m
//  GithubClientTests
//
//  Created by Gerard Gonzalez on 7/11/15.
//  Copyright (c) 2015 Gerard Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GithubRepository.h"

@interface GithubClientTests : XCTestCase
@property (nonatomic, strong) NSDictionary *sampleResponse;
@end

@implementation GithubClientTests

- (void)setUp {
    [super setUp];
    
    self.sampleResponse = @{@"name": @"AwesomeMenu",
                            @"description": @"is awesome",
                            @"updated_at": @"2015-08-09T15:33:45Z"};
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGithubRepository {
    GithubRepository *repository = [[GithubRepository alloc] initWithDictionary:self.sampleResponse];

    XCTAssert(repository != nil, @"Repository is not nil");
    
    XCTAssert([repository.name isEqualToString:@"AwesomeMenu"], @"Name equals AwesomeMenu");
    XCTAssert([repository.repositoryDescription isEqualToString:@"is awesome"], @"Repository description is awesome");
}

@end

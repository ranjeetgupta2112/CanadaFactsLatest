//
//  CanadaFactsPerformanceTests.m
//  CanadaFactsPerformanceTests
//
//  Created by Amal Rajan on 23/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FactsJsonObject.h"

@interface CanadaFactsPerformanceTests : XCTestCase

@end

@implementation CanadaFactsPerformanceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        FactsJsonObject *jsonObject = [[FactsJsonObject alloc] init];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
             [jsonObject fetchJsonData];
        });
    }];
}

@end

//
//  CanadaFactsWebServiceTest.m
//  CanadaFactsWebServiceTest
//
//  Created by Amal Rajan on 23/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FactsJsonObject.h"
@interface CanadaFactsWebServiceTest : XCTestCase

@end

@implementation CanadaFactsWebServiceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"WebService test getting started...");
}

- (void)testJsonObjectFecthing {
    FactsJsonObject *object = [[FactsJsonObject alloc]init];
    NSError *error;
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"] options:NSDataReadingUncached error:&error];
    //to check if I am able to download Json object and the class is able to parse well and return the data or not.
    XCTAssertTrue(data!=nil);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

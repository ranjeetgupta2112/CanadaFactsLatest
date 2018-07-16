//
//  CanadaFactsTestsNetworkMethodCAll.m
//  CanadaFactsTestsNetworkMethodCAll
//
//  Created by Amal Rajan on 25/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FactsJsonObject.h"

@interface CanadaFactsTestsNetworkMethodCAll : XCTestCase

@end

@implementation CanadaFactsTestsNetworkMethodCAll

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}  

- (void)testNetworkCallToFetchData{
    FactsJsonObject *facts = [[FactsJsonObject alloc]init];
    [facts fetchJsonData];
    XCTAssert(facts.responceData!= nil);
    if(facts.responceData!= nil){
        NSLog(@"Data fetched successfully!!!");
    }
}

@end

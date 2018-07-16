//
//  CanadaFactsCellTest.m
//  CanadaFactsCellTest
//
//  Created by Amal Rajan on 23/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FactsViewCell.h"

@interface CanadaFactsCellTest : XCTestCase

@end

@implementation CanadaFactsCellTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellElements {
    FactsViewCell *cell = [[FactsViewCell alloc]init];
    //to check if all cell elemts are available or not
    XCTAssert(cell.imageFact != nil);
    XCTAssert(cell.labelDescription != nil);
    XCTAssert(cell.labelTitle != nil);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

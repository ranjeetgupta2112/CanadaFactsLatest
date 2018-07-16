//
//  CanadaFactsInternetRechability.m
//  CanadaFactsInternetRechability
//
//  Created by Amal Rajan on 23/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Reachability.h"

@interface CanadaFactsInternetRechability : XCTestCase

@end

@implementation CanadaFactsInternetRechability

- (void)setUp {
    [super setUp];
    [self testInternetConnection];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInternetConnection {
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
    [reachability startNotifier];
    reachability.reachableBlock = ^(Reachability *reachability) {
        NSLog(@"Network is reachable.");
    };
    
    reachability.unreachableBlock = ^(Reachability *reachability) {
        NSLog(@"Network is unreachable.");
    };
}



@end

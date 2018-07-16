//
//  FactsJsonObject.h
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FactModel.h"

@protocol FactsJsonObjectDelegate

-(void)updateFactDataInUI:(FactModel *)model;
-(void)serviceFailedWithError:(NSError *)error;

@end

@interface FactsJsonObject : NSObject<NSURLConnectionDelegate>{
    NSMutableData *responceData;
}
-(void)fetchJsonData;
@property(retain,nonatomic)NSMutableData *responceData;
@property(weak,nonatomic) id delegate;


@end

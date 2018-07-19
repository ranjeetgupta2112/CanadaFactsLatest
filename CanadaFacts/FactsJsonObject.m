//
//  Services.m
//  Facts
//
//  Created by Amal Rajan on 5/20/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsJsonObject.h"
#import "FactModel.h"
#import "Reachability.h"

@implementation FactsJsonObject
@synthesize responceData = _responceData;
@synthesize delegate;

- (void)fetchJsonData{
    Reachability *reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
    [reachability startNotifier];
    if(reachability.isReachable){
        self.responceData = [[NSMutableData alloc]init];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"]];
        // Create url connection and fire request
        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [urlConnection start];
    }else{
        [delegate networkFailure:@"Please check your internet connection and try again"];
    }

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Appending the new data to the instance variable you declared
    [self.responceData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // We can parse the data to store it in model object.
    NSString *dataString = [[NSString alloc] initWithData:self.responceData encoding:NSASCIIStringEncoding];
    NSData *encodedData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError * error = nil;
    FactModel *factData = [FactModel fromData:encodedData error:&error];
    [delegate updateFactDataInUI:factData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!... We would setup an alert to show the user...
    // Check the error var
    [delegate serviceFailedWithError:error];
    
}

@end

//
//  MyPhoneNumber.m
//  ImAlive
//
//  Created by Guy Vider on 8/22/11.
//  Copyright 2011 Traveling Tech Guy. All rights reserved.
//

#import "MyPhoneNumberPlugin.h"

@implementation MyPhoneNumberPlugin

-(void)getMyPhoneNumber:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options {
	NSLog(@"at getMyPhoneNumber Plugin");
	//PluginResult* result;
    NSString* jsString;
    NSString* successCallback = [arguments objectAtIndex:0];
	NSString* failureCallback = [arguments objectAtIndex:1];
	
	NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] stringForKey:@"SBFormattedPhoneNumber"];
	NSLog(@"phone number: %@", phoneNumber);
	
	if([[[UIDevice currentDevice] model] isEqualToString:@"iPhone Simulator"])
		phoneNumber = @"0000000000";
	
	//if phone number is empty, fail
	if(phoneNumber == nil || [phoneNumber isEqualToString:@""]) {
        //result = [PluginResult resultWithStatus:PGCommandStatus_ERROR messageAsString:@"Could not get phone number"];
        //jsString = [result toErrorCallbackString:failureCallback];
		jsString = [NSString stringWithFormat:@"%@(\"%@\");", failureCallback, @"Could not get phone number"];
    }
    else {
        //result = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:phoneNumber];
        //jsString = [result toSuccessCallbackString:successCallback];
		jsString = [NSString stringWithFormat:@"%@({'phoneNumber':\"%@\"});", successCallback, phoneNumber];
    }
    
    [self writeJavascript:jsString];
}
@end

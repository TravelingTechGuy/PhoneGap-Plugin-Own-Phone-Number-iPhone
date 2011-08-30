//
//  MyPhoneNumber.m
//  ImAlive
//
//  Created by Guy Vider on 8/22/11.
//  Copyright 2011 Traveling Tech Guy. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "MyPhoneNumberPlugin.h"

@implementation MyPhoneNumberPlugin

-(void) getMyPhoneNumber:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options {
	NSLog(@"at getMyPhoneNumber Plugin");
	//PluginResult* result;
    NSString* jsString;
    NSString* successCallback = [arguments objectAtIndex:0];
	NSString* failureCallback = [arguments objectAtIndex:1];
	
	NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] stringForKey:@"SBFormattedPhoneNumber"];
	
	if(phoneNumber == nil || [phoneNumber isEqualToString:@""]) {
		NSLog(@"We're on a non-phone device. Returning a hash of the UDID");
		NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
		phoneNumber = [[self MD5Hash:udid] substringToIndex:10];
	}
	NSLog(@"phone number: %@", phoneNumber);
	
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

//generates md5 hash from a string
- (NSString *) MD5Hash:(NSString*)data {
    const char *concat_str = [data UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];	
}
@end

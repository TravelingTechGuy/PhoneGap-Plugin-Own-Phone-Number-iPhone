//
//  MyPhoneNumber.h
//  ImAlive
//
//  Created by Guy Vider on 8/22/11.
//  Copyright 2011 Traveling Tech Guy. All rights reserved.
//

#import <PhoneGap/PGPlugin.h>

@interface MyPhoneNumberPlugin : PGPlugin {
	
}

- (void) getMyPhoneNumber:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (NSString *) MD5Hash:(NSString*)data;
@end

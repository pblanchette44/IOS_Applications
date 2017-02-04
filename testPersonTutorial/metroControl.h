//
//  metroControl.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-25.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MidiBusClient.h"

@interface metroControl : NSObject

@property NSNumber* tempo;

-(void)customInit;

-(void)toggleMetro;
-(void)startMetroWithTempo:(int) tempo;



@end

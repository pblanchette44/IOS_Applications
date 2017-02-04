//
//  clockDivider.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-25.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MidiBusClient.h"
#import "voiceGateSequence.h"

@interface clockDivider : NSObject <MidiBusClientDelegate>

@property NSMutableArray *clockSpeeds;
@property voiceGateSequence *theVoiceGateSequence;

-(void)customInit;
-(void)setSpeedForVoice:(int) speed :(int) voiceIndex;

-(bool)clockIsTriggered:(int)inputCount forVoice:(int)voiceIndex;


@end

//
//  gateListObject.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gateVoiceObject.h"
#import "allVoicesMultiTouch.h"
#import "voiceGateSequence.h"

//define a protocol for the passing of value to the pitchEngine

@protocol pitchPassingDelegate <NSObject>

-(void)sendGateOnValueforStep:(int)step atVoice:(int)voiceIndex;

@end

@interface gateListObject : NSObject<allVoiceDelegate,gateQuerryDelegate>
{id <pitchEngineDelegate> _delegate;}
@property id delegate;


@property NSMutableArray *allVoicesGates;


-(id)initWithVoices;

-(bool)querryGateValueAtStep:(int)step atVoice:(int)voiceIndex;

@end

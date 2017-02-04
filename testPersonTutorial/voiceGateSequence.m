//
//  voiceGateSequence.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voiceGateSequence.h"

@implementation voiceGateSequence


-(void)customInit{

    self.allVoices = [NSMutableArray arrayWithCapacity:4];
    
    for(int i =0; i < 4;i++)
    {
        voice *newVoice = [[voice alloc] init];
        [newVoice baseInit];
        [self.allVoices addObject:newVoice];
    }
}

-(void)triggerStepIncrementforVoice:(int)voiceIndex
{
    [[self.allVoices objectAtIndex:voiceIndex] updateStepCount];
    
    int stepVal = [[[self.allVoices objectAtIndex:voiceIndex]stepCount] intValue];
    [self DisplayStepChangeInGateView:stepVal atVoice:voiceIndex];
    //send the stepCount to a gate list
    [self.delegate querryStepGateValue:stepVal forVoice:voiceIndex];
}

-(void)DisplayStepChangeInGateView:(int)stepValue atVoice:(int)voiceIndex
{
    [self.gateDisplay setStepDisplay:stepValue forVoice:voiceIndex];
}


@end

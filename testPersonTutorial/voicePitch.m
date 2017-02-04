//
//  voicePitch.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voicePitch.h"

@implementation voicePitch


-(void)customInit{
    self.PitchSequence = [NSMutableArray arrayWithCapacity:8];
    
    for(int i =0; i < 8;i++)
    {
        [self.PitchSequence addObject:[NSNumber numberWithInt:0]];
    }
    
    self.currentStep = [NSNumber numberWithInt:0];
}

-(void)updateStep:(int)value
{
    self.currentStep = [NSNumber numberWithInt:value];
}

-(void)updatePitchSequence:(CGVector)inputPosition
{
    [self.PitchSequence replaceObjectAtIndex:inputPosition.dx withObject:[NSNumber numberWithInt:inputPosition.dy]];
}


@end


//
//  clockDivider.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-25.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "clockDivider.h"

@implementation clockDivider
{
    int count;

}

-(void)customInit{
    
    self.clockSpeeds = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:24],
                        [NSNumber numberWithInt:48],
                        [NSNumber numberWithInt:12],
                        [NSNumber numberWithInt:12],nil];
    
    count = 0;
}

-(void) setSpeedForVoice:(int)speed :(int)voiceIndex
{
    [self.clockSpeeds
     replaceObjectAtIndex:voiceIndex
     withObject:[NSNumber numberWithInt:[self convertInputSpeed:speed]]];
}

-(int) convertInputSpeed:(int)inputSpeed
{
    return inputSpeed * 24;
}


-(void)receivedMidiBusClientEvent:(MIDIBUS_MIDI_EVENT *)event
{
    count++;
    
    for(int i =0 ; i < self.clockSpeeds.count ;i++)
    {
        if([self clockIsTriggered:count forVoice:i])
        {
            [self.theVoiceGateSequence triggerStepIncrementforVoice:i];
        }
    }
}

-(bool)clockIsTriggered:(int)inputCount forVoice:(int)voiceIndex
{
    if(inputCount%[[self.clockSpeeds objectAtIndex:voiceIndex] intValue] == 0)
    {
        return true;
    }
    return false;
}







@end

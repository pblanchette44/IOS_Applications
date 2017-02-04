//
//  gateListObject.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "gateListObject.h"

@implementation gateListObject


-(id)initWithVoices{
    
    self = [super init];
    
    if(self){
        [self customInit];
    }
    
    return self;
}

-(void) customInit{
    
    self.allVoicesGates = [NSMutableArray arrayWithCapacity:4];
    
    for(int i =0; i < 4; i++)
    {
        [self.allVoicesGates addObject:[[gateVoiceObject alloc] initWithContent]];
    }
}

-(int)querry:(int)step atVoice:(int)voiceIndex
{
    
    return [[[[self.allVoicesGates objectAtIndex:voiceIndex]gateList] objectAtIndex:step]intValue];
}

-(void)toggle:(int)step atVoice:(int)voiceIndex{
   
    [[self.allVoicesGates objectAtIndex:voiceIndex] toggleStep:step];
}


//todo check where this is called from ?
-(bool)querryGateValueAtStep:(int)step atVoice:(int)voiceIndex{
    return [[[self.allVoicesGates objectAtIndex:voiceIndex] gateList] objectAtIndex:step];
}

-(void)querryStepGateValue:(int)step forVoice:(int)voiceIndex{
    if([self querry:step atVoice:voiceIndex] == 1)
    {
        [self.delegate sendGateOnValueforStep:step atVoice:voiceIndex];
    }
}



@end

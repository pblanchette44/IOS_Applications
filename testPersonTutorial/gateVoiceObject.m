//
//  gateVoiceObject.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "gateVoiceObject.h"

@implementation gateVoiceObject


-(id)initWithContent{
    self = [super init];
    
    if(self){
              [self customInit];
    }
    
    return self;
}

-(void)customInit{

    self.sequenceLength = 8;
    
    self.gateList = [NSMutableArray arrayWithCapacity:8];
    for(int i =0; i < 8;i++)
    {
        [self.gateList addObject:[NSNumber numberWithBool:true]];
    }
    
    self.gateDuration = 200;
    self.direction = 1;
}

-(void)toggleStep:(int)step{
    
    if([[self.gateList objectAtIndex:step] intValue] == 1)
    {
        [self.gateList replaceObjectAtIndex:step withObject:[NSNumber numberWithInt:0]];
    } else {
        [self.gateList replaceObjectAtIndex:step withObject:[NSNumber numberWithInt:1]];
    }
    
    
}



@end

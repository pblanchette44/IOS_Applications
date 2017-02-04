//
//  metroControl.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-25.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "metroControl.h"

@implementation metroControl



-(void)customInit{
    self.tempo = [NSNumber numberWithInt:120];
}

-(void)toggleMetro{
    NSLog(@"metro is started");
        midibus_clock(MIDIBUS_CLOCK_START, [self.tempo intValue]);
}

-(void)startMetroWithTempo:(int)tempo{
    self.tempo = [NSNumber numberWithInt:tempo];
    midibus_clock(MIDIBUS_CLOCK_START, tempo);
}

@end

//
//  voice.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voice.h"

@implementation voice


-(void)baseInit{
    
    self.length = [NSNumber numberWithInt:8];
    self.stepSize = [NSNumber numberWithInt:1];
    self.stepCount = [NSNumber numberWithInt:0];
}

-(void)updateStepCount{
    
    int tempStep = [self.stepCount intValue]+[self.stepSize intValue];
    tempStep = tempStep%[self.length intValue];
    self.stepCount = [NSNumber numberWithInt:tempStep];
}


@end





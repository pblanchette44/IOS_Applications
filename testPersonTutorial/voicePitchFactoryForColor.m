//
//  voicePitchFactoryForColor.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voicePitchFactoryForColor.h"

@implementation voicePitchFactoryForColor



+(voicePitch *)makeVoicePitchForColorIndex:(int)index
{
    if(index == 0)
    {
        voicePitch *temp = [[voicePitch alloc]init];
        [temp customInit];
        temp.stepColor = [UIColor redColor];
        return temp;
    } else if (index == 1)
    {
        voicePitch *temp = [[voicePitch alloc]init];
        [temp customInit];
        temp.stepColor = [UIColor blueColor];
        return temp;
    } else if (index == 2)
    {
        voicePitch *temp = [[voicePitch alloc]init];
        [temp customInit];
        temp.stepColor = [UIColor greenColor];
        return temp;
    } else
    {
        voicePitch *temp = [[voicePitch alloc]init];
        [temp customInit];
        temp.stepColor = [UIColor orangeColor];
        return temp;
    }
}

@end

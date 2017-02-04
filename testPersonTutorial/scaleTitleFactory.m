//
//  scaleTitleFactory.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "scaleTitleFactory.h"

@implementation scaleTitleFactory

+(NSString *)getModeNameForValue:(int)input{
    
    if(input == 0)
    {
        return [NSString stringWithFormat:@"Ionian"];
    } else if (input == 1)
    {
        return [NSString stringWithFormat:@"Dorian"];
    } else if (input == 2)
    {
        return [NSString stringWithFormat:@"Phrygian"];
    } else if (input == 3)
    {
        return [NSString stringWithFormat:@"Lydian"];
    } else if (input == 4)
    {
        return [NSString stringWithFormat:@"Myxo"];
    } else if (input == 5)
    {
        return [NSString stringWithFormat:@"Aeolien"];
    } else
    {
        return [NSString stringWithFormat:@"Locrian"];
    }
}

@end

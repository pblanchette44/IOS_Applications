//
//  voicePitch.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface voicePitch : NSObject

@property NSMutableArray *PitchSequence;
@property NSNumber *currentStep;
@property UIColor *stepColor;

-(void)customInit;
-(void)updateStep:(int)value;
-(void)updatePitchSequence:(CGVector)inputPosition;

@end

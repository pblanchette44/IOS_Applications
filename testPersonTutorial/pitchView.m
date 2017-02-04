//
//  pitchView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-20.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "pitchView.h"

@implementation pitchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit{
    [[NSBundle mainBundle] loadNibNamed:@"pitchView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    
    self.pitchSequence.delegate = self;
}

-(int)getValueAtIndex:(int)index{
    return [self.pitchSequence getValue:0];
}

-(void)setStepDisplay:(int)value forVoice:(int)voiceIndex
{
    [[self.pitchSequence.allVoices objectAtIndex:voiceIndex] updateStep:value];
    [self.pitchSequence setNeedsDisplay];
}

#pragma DelegateMethods

-(int)querryPitchValueForStep:(int)step{
    return [self.delegate querryPitchValueForStep:step];
}

-(void)setPitchValueForStep:(int)step forPitch:(int)inputPitch{
    [self.delegate changePitchValueForStep:step forPitch:inputPitch];
}



@end

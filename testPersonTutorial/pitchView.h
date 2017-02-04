//
//  pitchView.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-20.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testTouchPitch.h"


@protocol pitchEngineDelegate <NSObject>

-(int) querryPitchValueForStep:(int)step;
-(void) changePitchValueForStep:(int)step forPitch:(int)pitchInput;

@end

@interface pitchView : UIView <voiceDisplayDelegate>
{
    id <pitchEngineDelegate> _delegate;
}

@property (strong,strong) id delegate;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet testTouchPitch *pitchSequence;


-(int)getValueAtIndex:(int)index;
-(void)setStepDisplay:(int)value forVoice:(int)voiceIndex;


@end

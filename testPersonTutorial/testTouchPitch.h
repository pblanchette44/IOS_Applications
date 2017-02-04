//
//  testTouchPitch.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-20.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "voicePitch.h"
#import "voicePitchFactoryForColor.h"

@protocol voiceDisplayDelegate <NSObject>

@required
-(int) querryPitchValueForStep:(int)step;
-(void) setPitchValueForStep:(int)step forPitch:(int)inputPitch;
@end

@interface testTouchPitch : UIView
{
    id <voiceDisplayDelegate> _delegate;
}

@property (strong,strong)id delegate;
@property NSMutableArray *stepValues;
@property NSMutableArray *stepString;
@property NSMutableArray *allVoices;

-(int)getValue:(int)index;

@end

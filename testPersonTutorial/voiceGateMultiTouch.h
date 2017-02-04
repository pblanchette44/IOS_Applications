//
//  voiceGateMultiTouch.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol voiceGateDelegate <NSObject>
@required
-(int)sendToVoices:(int)step atVoice:(int)voiceIndex;
-(void)toggleToVoices:(int)step atVoice:(int)voiceIndex;
@end;

@interface voiceGateMultiTouch : UIView
{
    id <voiceGateDelegate> _delegate;
}

@property (strong,strong) id delegate;
@property NSNumber *voiceId;

@end

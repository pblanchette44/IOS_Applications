//
//  allVoicesMultiTouch.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-30.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "voiceGateMultiTouch.h"

@protocol allVoiceDelegate <NSObject>
@required
-(int)querry:(int)step atVoice:(int)voiceIndex;
-(void)toggle:(int)step atVoice:(int)voiceIndex;
@end;

@interface allVoicesMultiTouch : UIView <voiceGateDelegate>
{
      id <allVoiceDelegate> _delegate;
}

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet voiceGateMultiTouch *voice1;
@property (strong, nonatomic) IBOutlet voiceGateMultiTouch *voice2;
@property (strong, nonatomic) IBOutlet voiceGateMultiTouch *voice3;
@property (strong, nonatomic) IBOutlet voiceGateMultiTouch *voice4;

@property (strong,strong) id delegate;

@end

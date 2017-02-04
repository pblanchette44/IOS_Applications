//
//  allVoicesMultiTouch.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-30.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "allVoicesMultiTouch.h"

@implementation allVoicesMultiTouch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        [self customInit];
    }
    
    return self;
}

-(void)customInit{
    
    [[NSBundle mainBundle] loadNibNamed:@"allVoicesView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    
    self.voice1.delegate = self;
        self.voice1.voiceId = [NSNumber numberWithInt:0];
    self.voice2.delegate = self;
        self.voice2.voiceId = [NSNumber numberWithInt:1];
    self.voice3.delegate = self;
        self.voice3.voiceId = [NSNumber numberWithInt:2];
    self.voice4.delegate = self;
        self.voice4.voiceId = [NSNumber numberWithInt:3];
    
}

-(int)sendToVoices:(int)step atVoice:(int)voiceIndex{

    return [self.delegate querry:step atVoice:voiceIndex];
}

-(void)toggleToVoices:(int)step atVoice:(int)voiceIndex{
    [self.delegate toggle:step atVoice:voiceIndex];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
